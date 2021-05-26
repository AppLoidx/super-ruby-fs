require_relative 'arg_util'
require_relative 'ui'

include ArgUtil
include UIModule

params = getOpts

if assertParams(params)
  run(params["mode"], params["path"])
else
  printHelp
end