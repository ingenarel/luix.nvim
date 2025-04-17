local m = {}

function m.parse(inputs, outputs)
	local file = {}
	local line = 1

	file[line] = "{ "
	for i = 1, #inputs - 1 do
		file[line] = file[line] .. inputs[i] .. ", "
	end
	file[line] = file[line] .. inputs[#inputs] .. " }: {"

	if type(outputs.systemPackages) == "table" then
		line = line + 1
		file[line] = "    environment.systemPackages = with pkgs; ["
		line = line + 1
		for i = 1, #outputs.systemPackages do
			file[line] = "        " .. outputs.systemPackages[i]
			line = line + 1
		end
		file[line] = "    ];"
	end

	line = line + 1
	file[line] = "}"
	return file
end

function m.printFile(file)
	for i = 1, #file do
		print(file[i])
	end
end

return m
