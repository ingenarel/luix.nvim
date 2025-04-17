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

function m.printFile(file)
	for i = 1, #file do
		print(file[i])
	end
end

return m
