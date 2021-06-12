class RespStruct < FFI::Struct
    layout :response, [:strptr, 128]
end