local m = {}

function m.parse(inputs, outputs)
    local file = ""

    file = file .. "{ "
    for i = 1, #inputs - 1 do
        file = file .. inputs[i] .. ", "
    end
    file = file .. inputs[#inputs] .. " }: {\n"

    if type(outputs.systemPackages) == "table" then
        file = file .. "    environment.systemPackages = with pkgs; [\n"
        for i = 1, #outputs.systemPackages do
            file = file .. "        " .. outputs.systemPackages[i] .. "\n"
        end
        if type(outputs.systemPackages.python313Packages) == "table" then
            file = file .. "        (pkgs.python313.withPackages (python313Packages: [\n"
            for i = 1, #outputs.systemPackages.python313Packages do
                file = file .. "            " .. outputs.systemPackages.python313Packages[i] .. "\n"
            end
            file = file .. "        ]))\n"
        end
        if type(outputs.systemPackages.python312Packages) == "table" then
            file = file .. "        (pkgs.python312.withPackages (python312Packages: [\n"
            for i = 1, #outputs.systemPackages.python312Packages do
                file = file .. "            " .. outputs.systemPackages.python312Packages[i] .. "\n"
            end
            file = file .. "        ]))\n"
        end
        file = file .. "    ];\n"
    end

    file = file .. "}\n"
    return file
end

function m.saveFile(contents, filePath)
    local file = io.open(vim.fs.normalize(filePath), "w")
    if file ~= nil then
        file:write(contents)
        file:close()
    end
end

return m
