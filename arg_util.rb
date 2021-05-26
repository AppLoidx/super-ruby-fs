require 'getopt/long'

module ArgUtil

  def getOpts
    params = {}
    begin
      
      # Getting options from arg-line

      opt = Getopt::Long.getopts(
        
        ["--mode", "-m", Getopt::REQUIRED],
        
        ["--path", "-p", Getopt::OPTIONAL],
        
        ["--help", "-h", Getopt::BOOLEAN]
      )

      if opt["mode"]
        # converting to int
        params["mode"] = opt["mode"].to_i
      end
      if opt["path"]
        params["path"] = opt["path"]
      end
      if opt["help"]
        params["help"] = true
      else
        params["help"] = false
      end

      return params
    rescue Exception
      return nil
    end
  end

  def assertParams(params)
    if !params ||
       params["help"] ||
      !params["mode"] ||
       params["mode"] != 1 &&
       (params["mode"] == 2 && !params["path"])

      return false
    end

    true
  end

  def printHelp

     saitama = "⠀⠀⠀⠀⠀
     ⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠲⡀⠀
     ⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀⠀⡏⠀⠀⠀⠀⠀⢷
     ⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀⠀⠀ ⡇
     ⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀Kill⠀ ⡇
     ⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀⣿⠀⢹⠀⠀me⠀ ⡇
     ⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀⡼
     ⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⠞⠀
     ⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
     ⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀
     ⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀
     ⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀
     ⣿⣿⣧⣀⣿………⣀⣰⣏⣘⣆⣀" 
    
    puts("")
    puts("Ya-hellooo! Use \"-m 2\" option to run app as xfs manager (use -p option to xfs file system file)")
    puts("Or you can use \"-m 1\" to view info about disks and partitions")
    puts("")

    puts(saitama)
  end
end
