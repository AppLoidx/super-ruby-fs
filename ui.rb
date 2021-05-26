require_relative 'utils'

require 'fiddle'

include Utils

module UIModule

  def printStartWelcomeMsg()
    puts("👾  👾  👾   Labwork numba 2 👾  👾  👾  ")
  end

  def pointer_to_string(ffi_pointer)
    address = ffi_pointer.to_i
    fiddle = ::Fiddle::Pointer.new(address)
    fiddle.to_s
  end



  def run(mode, path)
    printStartWelcomeMsg()

    if mode == 1
        
        # Printing disks and partitions

        output = Utils.init_output_buffer
        Utils.get_disks_and_partitions(output)
        str = pointer_to_string(output)
        print(str)
        Utils.destroy_output_buffer(output)

    else

      # Entering ui mode

      output = Utils.init_output_buffer
      xfs_struct = Utils.xfs_init(path, nil, output)
      str = pointer_to_string(output)
      if str != ""
        print(str)
        return
      end
      begin
        input = ""
        while input != "q"
          print("@#> ")
          input = STDIN.gets.chomp
          if input != "" && input != "q"
            tokens = input.split(' ')
            command = Utils.get_command_by_str(tokens[0])
            argc = tokens.length - 1
            argv = Utils.init_argv(argc)
            for i in 0..argc-1
              Utils.add_argv(i, argv, tokens[i+1])
            end
            output = Utils.init_output_buffer
            Utils.execute_xfs_operation(command, output, argc, argv, xfs_struct)
            str = pointer_to_string(output)
            print(str)
            Utils.destroy_output_buffer(output)
            Utils.destroy_argv(argv, argc)
          end
        end
      rescue Exception
        puts("Hey, man, you an exception. Do with that somthg")
        return
      end
    end


  end
end