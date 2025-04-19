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
        file = file .. "    ];\n"
    end

    file = file .. "}"
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
