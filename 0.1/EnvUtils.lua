EnvUtils={}

function EnvUtils:IsSandboxed()
	return env().sandbox ~= nil
end

--if the cart was saved from the bbs or runned in sandbox
--return nil otherwise
function EnvUtils:GetBbsId()
	local meta=fetch_metadata(env().argv[0])
	if(meta.bbs_id) return meta.bbs_id
	if(meta.title) return meta.title
	
	local cartName=split(env().argv[0],"/")
	cartName=cartName[#cartName]
	cartName=split(cartName,".")
	return cartName[1]
end