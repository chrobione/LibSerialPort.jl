
module LibSerialPort

export
    # Enum types
    SPReturn,
    SPMode,
    SPEvent,
    SPBuffer,
    SPParity,
    SPrts,
    SPcts,
    SPdtr,
    SPdsr,
    SPXonXoff,
    SPFlowControl,
    SPSignal,
    SPTransport,

    # Enum values
    SP_OK,
    SP_ERR_ARG,
    SP_ERR_FAIL,
    SP_ERR_MEM,
    SP_ERR_SUPP,

    SP_MODE_READ,
    SP_MODE_WRITE,
    SP_MODE_READ_WRITE,

    SP_EVENT_RX_READY,
    SP_EVENT_TX_READY,
    SP_EVENT_ERROR,

    SP_BUF_INPUT,
    SP_BUF_OUTPUT,
    SP_BUF_BOTH,

    SP_PARITY_INVALID,
    SP_PARITY_NONE,
    SP_PARITY_ODD,
    SP_PARITY_EVEN,
    SP_PARITY_MARK,
    SP_PARITY_SPACE,

    SP_RTS_INVALID,
    SP_RTS_OFF,
    SP_RTS_ON,
    SP_RTS_FLOW_CONTROL,

    SP_CTS_INVALID,
    SP_CTS_IGNORE,
    SP_CTS_FLOW_CONTROL,

    SP_DTR_INVALID,
    SP_DTR_OFF,
    SP_DTR_ON,
    SP_DTR_FLOW_CONTROL,

    SP_DSR_INVALID,
    SP_DSR_IGNORE,
    SP_DSR_FLOW_CONTROL,

    SP_XONXOFF_INVALID,
    SP_XONXOFF_DISABLED,
    SP_XONXOFF_IN,
    SP_XONXOFF_OUT,
    SP_XONXOFF_INOUT,

    SP_FLOWCONTROL_NONE,
    SP_FLOWCONTROL_XONXOFF,
    SP_FLOWCONTROL_RTSCTS,
    SP_FLOWCONTROL_DTRDSR,

    SP_SIG_CTS,
    SP_SIG_DSR,
    SP_SIG_DCD,
    SP_SIG_RI,

    SP_TRANSPORT_NATIVE,
    SP_TRANSPORT_USB,
    SP_TRANSPORT_BLUETOOTH,

    # Functions from libserialport API
    sp_get_port_by_name,
    sp_free_port,
    sp_list_ports,
    sp_copy_port,
    sp_free_port_list,
    sp_open,
    sp_close,
    sp_get_port_name,
    sp_get_port_description,
    sp_get_port_transport,
    sp_get_port_usb_bus_address,
    sp_get_port_usb_vid_pid,
    sp_get_port_usb_manufacturer,
    sp_get_port_usb_product,
    sp_get_port_usb_serial,
    sp_get_port_bluetooth_address,
    sp_get_port_handle,
    sp_new_config,
    sp_free_config,
    sp_get_config,
    sp_set_config,
    sp_set_baudrate,
    sp_get_config_baudrate,
    sp_set_config_baudrate,
    sp_set_bits,
    sp_get_config_bits,
    sp_set_config_bits,
    sp_set_parity,
    sp_get_config_parity,
    sp_set_config_parity,
    sp_set_stopbits,
    sp_get_config_stopbits,
    sp_set_config_stopbits,
    sp_set_rts,
    sp_get_config_rts,
    sp_set_config_rts,
    sp_set_cts,
    sp_get_config_cts,
    sp_set_config_cts,
    sp_set_dtr,
    sp_get_config_dtr,
    sp_set_config_dtr,
    sp_set_dsr,
    sp_get_config_dsr,
    sp_set_config_dsr,
    sp_set_xon_xoff,
    sp_get_config_xon_xoff,
    sp_set_config_xon_xoff,
    sp_set_config_flowcontrol,
    sp_set_flowcontrol,
    sp_blocking_read,
    sp_blocking_read_next,
    sp_nonblocking_read,
    sp_blocking_write,
    sp_nonblocking_write,
    sp_input_waiting,
    sp_output_waiting,
    sp_flush,
    sp_drain,
    sp_new_event_set,
    sp_add_port_events,
    sp_wait,
    sp_free_event_set,
    sp_get_signals,
    sp_start_break,
    sp_end_break,
    sp_last_error_code,
    sp_last_error_message,
    sp_get_major_package_version,
    sp_get_minor_package_version,
    sp_get_micro_package_version,
    sp_get_package_version_string,
    sp_get_current_lib_version,
    sp_get_revision_lib_version,
    sp_get_age_lib_version,
    sp_get_lib_version_string,

    # Wrapper object for high-level API
    SerialPort,

    # Functions from high-level API
    list_ports,
    print_port_metadata,
    print_port_settings,
    set_speed,
    set_frame,
    set_flow_control,
    seteof,
    reseteof

const depsdir = joinpath(dirname(dirname(@__FILE__)), "deps")
const depsfile = joinpath(depsdir, "deps.jl")
if isfile(depsfile)
    include(depsfile)

    # This is supposed to address runtime linking problems.
    # Exporting environment variables like (DY)LD_LIBRARY_PATH works,
    # but this is a more self-contained and portable solution.
    libdir = joinpath(depsdir, "usr/lib")
    if !in(libdir, Libdl.DL_LOAD_PATH)
        push!(Libdl.DL_LOAD_PATH, libdir)
    end
else
    error("LibSerialPort not properly installed. Please run Pkg.build(\"LibSerialPort\")")
end

include("wrap.jl")
include("high-level-api.jl")

end # LibSerialPort
