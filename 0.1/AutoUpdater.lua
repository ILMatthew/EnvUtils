AutoUpdater={}

--versioning assumes this format: 1.0.0+1
--where +1 is the cartridge version on the bbs
function AutoUpdater:GetCurrentVersion()
	local meta=fetch_metadata(env().argv[0])
	if(not meta.version) return 0,0
	local vdata=split(meta.version,"+")
	return vdata[1],vdata[2]
end

--credits: @369369369
--https://www.lexaloffle.com/bbs/?uid=91156#m
function AutoUpdater:IsLatestVersion() --true if latest, else false

	local cartName = EnvUtils:GetBbsId()
	local version,build = AutoUpdater:GetCurrentVersion()
	
	if(cartName==nil or build==nil) return true

	local cartURL = "https://www.lexaloffle.com/bbs/cart_info.php?cid="..cartName.."-"
	local newV = fetch(cartURL..(tonum(build) + 1)) -- +1 cause we want the next one 
	local strToFind = "missing cart_id" 
	
	if not newV then return true
	--if no page is fecthed... return true cause we don't need to update 
	else return string.find(newV, strToFind) ~= nil  end
	--elsif next version's page (fecthed in newV) contains strTofind, there is no new version!

end