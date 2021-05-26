require 'ffi'

module Utils
  extend FFI::Library
  ffi_lib 'shared/libxfs.so'
  attach_function(
    :init_output_buffer,
    :init_output_buffer,
    [],
    :pointer
  )
  attach_function(
    :destroy_output_buffer,
    :destroy_output_buffer,
    [:pointer],
    :void
  )
  attach_function(
    :get_disks_and_partitions,
    :get_disks_and_partitions,
    [:pointer],
    :void
  )
  attach_function(
    :execute_xfs_operation,
    :execute_xfs_operation,
    [:int, :pointer, :int, :pointer, :pointer],
    :void
  )
  attach_function(
    :xfs_init,
    :init,
    [:string, :pointer, :pointer],
    :pointer
  )
  attach_function(
    :init_argv,
    :init_argv,
    [:int],
    :pointer
  )
  attach_function(
    :add_argv,
    :add_argv,
    [:int, :pointer, :string],
    :int
  )
  attach_function(
    :destroy_argv,
    :destroy_argv,
    [:pointer, :int],
    :void
  )
  attach_function(
    :get_command_by_str,
    :get_command_by_str,
    [:string],
    :int
  )
end