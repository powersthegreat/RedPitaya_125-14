# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "MULT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REF_PERIOD" -parent ${Page_0}


}

proc update_PARAM_VALUE.MULT { PARAM_VALUE.MULT } {
	# Procedure called to update MULT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MULT { PARAM_VALUE.MULT } {
	# Procedure called to validate MULT
	return true
}

proc update_PARAM_VALUE.REF_PERIOD { PARAM_VALUE.REF_PERIOD } {
	# Procedure called to update REF_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REF_PERIOD { PARAM_VALUE.REF_PERIOD } {
	# Procedure called to validate REF_PERIOD
	return true
}


proc update_MODELPARAM_VALUE.MULT { MODELPARAM_VALUE.MULT PARAM_VALUE.MULT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MULT}] ${MODELPARAM_VALUE.MULT}
}

proc update_MODELPARAM_VALUE.REF_PERIOD { MODELPARAM_VALUE.REF_PERIOD PARAM_VALUE.REF_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REF_PERIOD}] ${MODELPARAM_VALUE.REF_PERIOD}
}

