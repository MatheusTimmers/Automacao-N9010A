s��   	     z�   � %  U�   �   ����                                IviRFSigGen                     IviRFSigGen Class Driver                                                                              � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr   �    This instrument driver contains programming support for the IviRFSigGen.  This driver has all the functions that IVI and VXIplug&play require.  

Note:  This driver requires the VISA and IVI libraries.       �    This class contains functions and sub-classes that configure the instrument.  The class includes high-level functions that configure multiple instrument settings as well as low-level functions that set, get, and check individual attribute values.
     S    This class contains functions to configure the base capabilities of the RFSigGen.    $    The IviRFSigGenModulateAM Extension Group supports signal generators that can apply amplitude modulation to the RF output signal. The user can enable or disable amplitude modulation, specify the source and coupling of the modulating signal and the modulation depth with lin/log attenuation.     �    The IviRFSigGenModulatePulse Extension Group supports signal generators that can apply pulse modulation to the RF output signal. The user can enable or disable pulse modulation, and specify the source and the polarity of the modulating signal.     _    This class contains functions to configure the low frequency (LF) functionality of RFSigGens.     ^    This class contains sub-classes to configure the pulse generator functionality of RFSigGens.    
    This class contains functions and sub-classes to configure the different sweep functionalities of the RFSigGen.

The IviRFSigGenSweep extension group supports signal generators with the ability to sweep (or step) the frequency or the power of the RF output signal.    4    The IviRFSigGenList Extension Group supports signal generators that can set the frequency and power of the RF output signal to values given as a list of values. The user can enable or disable stepping the frequency and power list, specify the name of the list and set it's values. The active list can be selected usingd the list name. Setting single step and dwell time are also included.

This extension group requires the Sweep extension group. List stepping is enabled by setting the sweep mode to IVIRFSIGGEN_VAL_SWEEP_MODE_LIST in the sweep extension group.     @    For generators with configurable Automatic Level Control(ALC).     x    The IviRFSigGenReferenceOscillator extension group supports signal generators with a configurable frequency reference.        The IviRFSigGenModulateIQ Extension Group supports signal generators that can apply IQ (vector) modulation to the RF output signal. The user can enable or disable IQ modulation and specify the source of the modulating signal. A calibration is executed with an event function.     r    This class contains functions and sub-classes to configure the arbitrary waveform functionality of the RFSigGen.    }    With IviRFSigGenDigitalModulationBase Extension Group the user can generate signals conforming to wireless communication standards (e.g. mobile cellular standards). The generated signals do not have TDMA framing nor CDMA channel coding.
The functionality covers basic modulation properties such as IQ constellation, symbol mapping, etc. within a specified communication standard.     �    This class includes all of the configuration functions for the Code Division Multiple Access(CDMA) functionality extension group.     �    This class includes all of the configuration functions for the Time Division Multiple Access(TDMA) functionality extension group.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     m    This class contains functions and sub-classes that initiate instrument operations and report their status.
    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    K    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviRFSigGen_LockSession and IviRFSigGen_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleRFSigGen"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviRFSigGen_LockSession and IviRFSigGen_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    � 9   �  �    Logical Name                      � 9 �       ID Query                           � 9� �       Reset Device                      !n �� �  �    Instrument Handle                 $2#����  �    Status                             "SampleRFSigGen"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          e    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    IVIRFSIGGEN_ATTR_RANGE_CHECK         
    IVIRFSIGGEN_ATTR_QUERY_INSTRUMENT_STATUS  
    IVIRFSIGGEN_ATTR_CACHE               
    IVIRFSIGGEN_ATTR_SIMULATE            
    IVIRFSIGGEN_ATTR_RECORD_COERCIONS    

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviRFSigGen_LockSession and IviRFSigGen_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleRFSigGen"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviRFSigGen_LockSession and IviRFSigGen_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVIRFSIGGEN_ATTR_RANGE_CHECK
QueryInstrStatus  IVIRFSIGGEN_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIRFSIGGEN_ATTR_CACHE   
Simulate          IVIRFSIGGEN_ATTR_SIMULATE  
RecordCoercions   IVIRFSIGGEN_ATTR_RECORD_COERCIONS

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the session uses the default values for the attributes.   You can override the default values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, its default value will be used.  

The default values for the attributes are shown below:

    Attribute Name     Default Value
    ----------------   -------------
    RangeCheck         VI_TRUE
    QueryInstrStatus   VI_FALSE
    Cache              VI_TRUE
    Simulate           VI_FALSE
    RecordCoercions    VI_FALSE
    

The following are the valid values for ViBoolean attributes:

    True:     1, True, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"
    4	 9   �  �    Logical Name                      7� 9 �       ID Query                          9� 9� �       Reset Device                      :� �� �  �    Instrument Handle                 =c#����  �    Status                            Db �  � �    Option String                      "SampleRFSigGen"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    U    This function configures the frequency and the power level of the RF output signal.     �    Specifies the frequency of the generated RF signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY attribute.

Units: Hertz

Default Value: 1.0 MHz     �    Specifies the power level of the generated RF signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_LEVEL attribute.

Units: dBm

Default Value: 0.0     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    M! 9  �  �    Frequency                         M� 9� �  �    Power Level                       N}-   �  �    Instrument Handle                 O=#����  �    Status                             1.0e6    0.0        	           4    This function enables the Automatic Level Control.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    6    Specifies whether to enable or disable Automatic Level Control (ALC). The driver uses this value to set the IVIRFSIGGEN_ATTR_ALC_ENABLED attribute.

Valid Values:
VI_TRUE  (1) - Enables the Automatic Level Control (ALC)
VI_FALSE (0) - Disables the Automatic Level Control (ALC)

Default Value:  VI_TRUE  (1)
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    Wl-   �  �    Instrument Handle                 X, 9 �  �    ALC Enabled                       Yj#����  �    Status                                True VI_TRUE False VI_FALSE    	           -    This function enables the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Specifies whether to enable or disable the RF output signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_OUTPUT_ENABLED attribute.

Valid Values:
VI_TRUE  (1) - Output enabled
VI_FALSE (0) - Output disabled

Default Value:  VI_FALSE (0)    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    al-   �  �    Instrument Handle                 b, 9 �  �    Output Enabled                    c-#����  �    Status                                 True VI_TRUE False VI_FALSE    	           f    This function configures the signal generator to apply amplitude modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    .    Specifies whether the signal generator applies amplitude modulation to the RF output signal or not. The driver uses this value to set the IVIRFSIGGEN_ATTR_AM_ENABLED attribute.

Valid Values:
VI_TRUE  (1) - Amplitude modulation On
VI_FALSE (0) - Amplitude modulation Off

Default Value:  VI_FALSE (0)    kh-   �  �    Instrument Handle                 l(#����  �    Status                            s' 9 �  �    AM Enabled                             	           True VI_TRUE False VI_FALSE    W    This function configures the coupling of an external source for amplitude modulation.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    W    Specifies the coupling of the external source of the modulating signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_AM_EXTERNAL_COUPLING attribute.

Defined Values:

IVIRFSIGGEN_VAL_AM_EXTERNAL_COUPLING_AC - AC Coupling
IVIRFSIGGEN_VAL_AM_EXTERNAL_COUPLING_DC - DC Coupling

Default Value: IVIRFSIGGEN_VAL_AM_EXTERNAL_COUPLING_AC
    u�-   �  �    Instrument Handle                 vJ#����  �    Status                            }I 9 � � �    AM External Coupling                   	                      VAC IVIRFSIGGEN_VAL_AM_EXTERNAL_COUPLING_AC DC IVIRFSIGGEN_VAL_AM_EXTERNAL_COUPLING_DC    u    This function configures the modulation source, scaling, and depth for the signal generator's amplitude modulation.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    '    Specifies the source of the signal that is used as the modulating signal. If more than one source is specified, the voltages of all sources (internal and external) are summed.  Multiple source names are separated by commas. The driver uses this value to set the IVIRFSIGGEN_ATTR_AM_SOURCE attribute. 

Users who want to achieve interchangeability should use a virtual AM source name. The virtual AM source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical AM source name.

Default Value: ""    r    Specifies linear or logarithmic attenuation for amplitude modulation. The unit of the IVIRFSIGGEN_ATTR_AM_DEPTH attribute is changed with this setting. The driver uses this value to set the IVIRFSIGGEN_ATTR_AM_SCALING attribute.

Defined Values:
IVIRFSIGGEN_VAL_AM_SCALING_LINEAR
IVIRFSIGGEN_VAL_AM_SCALING_LOGARITHMIC

Default Value: IVIRFSIGGEN_VAL_AM_SCALING_LINEAR    �    Specifies the extent of modulation the signal generator applies to the RF-signal (carrier waveform) with the modulating signal as a result of summing all sources, internal and external. The driver uses this value to set the IVIRFSIGGEN_ATTR_AM_DEPTH attribute. 

Units: If the IVIRFSIGGEN_ATTR_AM_SCALING attribute is set to Linear, then the units are percent (%). If the IVIRFSIGGEN_ATTR_AM_SCALING attribute is set to logarithmic, then the units are dBm.

Default Value: 0.0    �9-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Source                            �' 9 � � �    Scaling                           �� 9� �  �    Depth                                  	           ""               \Linear IVIRFSIGGEN_VAL_AM_SCALING_LINEAR Logarithmic IVIRFSIGGEN_VAL_AM_SCALING_LOGARITHMIC    0.0    f    This function configures the signal generator to apply frequency modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    .    Specifies whether the signal generator applies frequency modulation to the RF output signal or not. The driver uses this value to set the IVIRFSIGGEN_ATTR_FM_ENABLED attribute.

Valid Values:
VI_TRUE  (1) - Frequency modulation On
VI_FALSE (0) - Frequency modulation Off

Default Value:  VI_FALSE (0)    ��-   �  �    Instrument Handle                 �F#����  �    Status                            �E 9 �  �    FM Enabled                             	           True VI_TRUE False VI_FALSE    W    This function configures the coupling of an external source for frequency modulation.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    V    Specifies the coupling of the external source of the modulating signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_FM_EXTERNAL_COUPLING attribute.

Defined Values:

IVIRFSIGGEN_VAL_FM_EXTERNAL_COUPLING_AC - AC Coupling
IVIRFSIGGEN_VAL_FM_EXTERNAL_COUPLING_DC - DC Coupling

Default Value: IVIRFSIGGEN_VAL_FM_EXTERNAL_COUPLING_AC    ��-   �  �    Instrument Handle                 �h#����  �    Status                            �g 9 � � �    FM External Coupling                   	                      VAC IVIRFSIGGEN_VAL_FM_EXTERNAL_COUPLING_AC DC IVIRFSIGGEN_VAL_FM_EXTERNAL_COUPLING_DC    z    This function configures the modulation deviation and modulation source for the signal generator's frequency modulation.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    '    Specifies the source of the signal that is used as the modulating signal. If more than one source is specified, the voltages of all sources (internal and external) are summed.  Multiple source names are separated by commas. The driver uses this value to set the IVIRFSIGGEN_ATTR_FM_SOURCE attribute. 

Users who want to achieve interchangeability should use a virtual FM source name. The virtual FM source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical FM source name.

Default Value: ""    K    Specifies the extent of modulation (peak frequency deviation) the signal generator applies to the RF-signal (carrier waveform) with the modulating signal as a result of summing all sources, internal and external.  The driver uses this value to set the IVIRFSIGGEN_ATTR_FM_DEVIATION attribute. 

Units: Hertz

Default Value: 0.0

    �[-   �  �    Instrument Handle                 �#����  �    Status                            � 9  �  �    Source                            �I 9� �  �    Deviation                              	           ""    0.0    b    This function configures the signal generator to apply phase modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    "    Specifies whether the signal generator applies phase modulation to the RF output signal or not. The driver uses this value to set the IVIRFSIGGEN_ATTR_PM_ENABLED attribute.

Valid Values:
VI_TRUE  (1) - Phase modulation On
VI_FALSE (0) - Phase modulation Off

Default Value:  VI_FALSE (0)    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 �  �    PM Enabled                             	           True VI_TRUE False VI_FALSE    S    This function configures the coupling of an external source for phase modulation.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the coupling of the external source of the modulating signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_PM_EXTERNAL_COUPLING attribute.

Defined Values:

IVIRFSIGGEN_VAL_PM_EXTERNAL_COUPLING_AC
   - The external source is coupled for AC only. 
IVIRFSIGGEN_VAL_PM_EXTERNAL_COUPLING_DC
   - The external source is coupled for both DC and AC.

Default Value: IVIRFSIGGEN_VAL_PM_EXTERNAL_COUPLING_AC
    �	-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � � �    PM External Coupling                   	                      VAC IVIRFSIGGEN_VAL_PM_EXTERNAL_COUPLING_AC DC IVIRFSIGGEN_VAL_PM_EXTERNAL_COUPLING_DC       Configures the attribute that control the signal generator's phase modulation. The attributes are the modulation deviation and the modulating source(s).

This function configures the modulation deviation and modulation source for the signal generator's phase modulation.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    '    Specifies the source of the signal that is used as the modulating signal. If more than one source is specified, the voltages of all sources (internal and external) are summed.  Multiple source names are separated by commas. The driver uses this value to set the IVIRFSIGGEN_ATTR_PM_SOURCE attribute. 

Users who want to achieve interchangeability should use a virtual PM source name. The virtual PM source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical PM source name.

Default Value: ""    F    Specifies the extent of modulation (peak phase deviation) the signal generator applies to the RF-signal (carrier waveform) with the modulating signal as a result of summing all sources, internal and external. The driver uses this value to set the IVIRFSIGGEN_ATTR_PM_DEVIATION attribute. 

Units: radians

Default Value: 0.0    ơ-   �  �    Instrument Handle                 �a#����  �    Status                            �` 9  �  �    Source                            Џ 9� �  �    Deviation                              	           ""    0.0   S    This function returns the specific driver defined analog modulation source name that corresponds to the one-based index specified by the Index parameter.  If you pass in a value for the Index parameter that is less than one or greater than the value of the IVIRFSIGGEN_ATTR_ANALOG_MODULATION_SOURCE_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.

Note:  For an instrument with only one analog modulation source, i.e. the IVIRFSIGGEN_ATTR_ANALOG_MODULATION_SOURCE_COUNT attribute is one, the driver may return an empty string.

     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The index of the analog modulation source whose name is returned. The value must be greater than or equal to one and less than or equal to IVIRFSIGGEN_ATTR_ANALOG_MODULATION_SOURCE_COUNT.

Note:

Zero is not a legal value.

Default Value: 1
     C    Specify the buffer size for the Name parameter.

Default Value: 0     E    The analog modulation source name that corresponds to the Index.  
    �)-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Index                             �� 9 � �  �    Name Buffer Size                  �. 9� �  �    Name                                   	           1    0    	            b    This function configures the signal generator to apply pulse modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    5    Specifies whether the signal generator applies pulse modulation to the RF output signal or not. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_MODULATION_ENABLED attribute.

Valid Values:
VI_TRUE  (1) - Enables pulse modulation
VI_FALSE (0) - Disables pulse modulation

Default Value: VI_FALSE    �-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 �  �    Pulse Modulation Enabled               	           True VI_TRUE False VI_FALSE    M    This function sets the source for pulse modulation of the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the source of the signal that is used as the modulating signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_MODULATION_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_PULSE_MODULATION_SOURCE_INTERNAL 
    - The internal pulse generator is used for modulation.

IVIRFSIGGEN_VAL_PULSE_MODULATION_SOURCE_EXTERNAL 
    - An external generator is used for modulation

Default Value: 
IVIRFSIGGEN_VAL_PULSE_MODULATION_SOURCE_INTERNAL
    �3-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � � �    Source                                 	                      tInternal IVIRFSIGGEN_VAL_PULSE_MODULATION_SOURCE_INTERNAL External IVIRFSIGGEN_VAL_PULSE_MODULATION_SOURCE_EXTERNAL    E    This function specifies the polarity of the external source signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the polarity of the external source signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_MODULATION_EXTERNAL_POLARITY attribute.

Defined Values:

IVIRFSIGGEN_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_NORMAL
  - The signal generator modulates the carrier signal with
    normal pulse polarity. Increasing the positive pulse 
    voltage level results in higher RF level.

IVIRFSIGGEN_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_INVERSE
  - The signal generator modulates the carrier signal with 
    inverted pulse polarity. Increasing the positive pulse
    voltage level results in lower RF level.

Default Value: IVIRFSIGGEN_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_NORMAL    �E-   �  �    Instrument Handle                 �#����  �    Status                            � 9 � � �    External Polarity                      	                      �Normal IVIRFSIGGEN_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_NORMAL Inverse IVIRFSIGGEN_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_INVERSE    L    This function configures the LF generators output frequency and  waveform.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the frequency of the active LF generator. The driver uses this value to set the IVIRFSIGGEN_ATTR_LF_GENERATOR_FREQUENCY attribute.

Units: Hertz

Default Value: 500 Hz    ?    Specifies the waveform of the active LF generator. The driver uses this value to set the IVIRFSIGGEN_ATTR_LF_GENERATOR_WAVEFORM attribute.

Defined Values:

IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_SINE 
  - Sinusoid waveform.

IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_SQUARE 
  - Square waveform.

IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_TRIANGLE 
  - Triangle waveform.

IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_RAMP_UP 
  - Rising ramp waveform.

IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_RAMP_DOWN 
  - Falling ramp waveform.

Default Value: IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_SINE   W-   �  �    Instrument Handle                #����  �    Status                           	 9  �  �    Frequency                        	� 9� � �    Waveform                               	           500              Sine IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_SINE Square IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_SQUARE Triangle IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_TRIANGLE Ramp Up IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_RAMP_UP Ramp Down IVIRFSIGGEN_VAL_LF_GENERATOR_WAVEFORM_RAMP_DOWN   /    This function returns the specific driver defined LF generator source name that corresponds to the one-based index specified by the Index parameter.  If you pass in a value for the Index parameter that is less than one or greater than the value of the IVIRFSIGGEN_ATTR_LF_GENERATOR_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.

Note:  For an instrument with only one LF generator source, i.e. the IVIRFSIGGEN_ATTR_LF_GENERATOR_COUNT attribute is one, the driver may return an empty string.     �    The index of the analog modulation source whose name is returned. The value must be greater than or equal to one and less than or equal to IVIRFSIGGEN_ATTR_LF_GENERATOR_COUNT.

Note:

Zero is not a legal value.

Default Value: 0     C    Specify the buffer size for the Name parameter.

Default Value: 0     @    The LF generator source name that corresponds to the Index.  
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   U 9  �  �    Index                            C 9 � �  �    Name Buffer Size                 � 9� �  �    Name                             �-   �  �    Instrument Handle                �#����  �    Status                             0    0    	                	           g    This function selects one of the available LF generator sources, and makes it the active LFGenerator.    �    Specifies the LF generator which is currently active. The values for this arttribute correspond to the LFGenerator repeated capability.  The driver uses this value to set the IVIRFSIGGEN_ATTR_ACTIVE_LF_GENERATOR attribute.

Users who want to achieve interchangeability should use a virtual LF generator name. The virtual LF generator name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical LF generator name.

Default Value: ""     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   3 > � �  �    Active LFGenerator               -   �  �    Instrument Handle                �#����  �    Status                             ""        	           d    This function sets the output voltage and enables the LF generator within the RF signal generator.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the output voltage the of the LF generator. The driver uses this value to set the IVIRFSIGGEN_ATTR_LF_GENERATOR_OUTPUT_AMPLITUDE attribute.

Units: Volts peak to peak.

Default Value: 0.0     �    Specifies whether the LF generator applies an output signal or not. The driver uses this value to set the IVIRFSIGGEN_ATTR_LF_GENERATOR_OUTPUT_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

Default Value: VI_FALSE   %�-   �  �    Instrument Handle                &�#����  �    Status                           -� 9  �  �    Amplitude                        .� 9� �       Enabled                                	           0.0    True VI_TRUE False VI_FALSE    �    This function configures the triggering of the pulse generator within the RF signal generator.  This function specifies the external trigger slope and the delay time for starting the pulse after the trigger pulse.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies whether the event occurs on the rising or falling edge of the input signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_EXTERNAL_TRIGGER_SLOPE attribute.

Defined Values: IVIRFSIGGEN_VAL_PULSE_EXTERNAL_TRIGGER_SLOPE_POSITIVE 
  -  Enables rising edge triggering.

IVIRFSIGGEN_VAL_PULSE_EXTERNAL_TRIGGER_SLOPE_NEGATIVE
  -  Enables falling edge triggering.

Default Value: IVIRFSIGGEN_VAL_PULSE_EXTERNAL_TRIGGER_SLOPE_POSITIVE     {    Specifies the delay for starting the output pulse with respect to the trigger input. 

Units: Seconds

Default Value: 0.0   1Y-   �  �    Instrument Handle                2#����  �    Status                           9 9  � �    External Slope                   :� 9� �  �    Delay                                  	                      ~Positive IVIRFSIGGEN_VAL_PULSE_EXTERNAL_TRIGGER_SLOPE_POSITIVE Negative IVIRFSIGGEN_VAL_PULSE_EXTERNAL_TRIGGER_SLOPE_NEGATIVE    0.0    �    This function specifies the time period (repetition rate) of the pulse generator when using the internal trigger (free run) mode.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Specifies the period of the pulse generator output signal when the attribute IVIRFSIGGEN_ATTR_PULSE_TRIGGER_SOURCE is set to Internal.  The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_INTERNAL_TRIGGER_PERIOD attribute.

Units: Seconds

Default Value: 1.0 ms   =l-   �  �    Instrument Handle                >,#����  �    Status                           E+ 9 � �  �    Period                                 	           1.0e-3    �    This function configures the trigger source, pulse width, and gating enabled for the pulse generator within the RF signal generator.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    _    Specifies the source of the signal the pulse generator uses to generate one pulse. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_TRIGGER_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_PULSE_TRIGGER_SOURCE_INTERNAL
  - No external trigger is used. The pulse period is specified by the IVIRFSIGGEN_ATTR_PULSE_INTERNAL_TRIGGER_PERIOD attribute.

IVIRFSIGGEN_VAL_PULSE_TRIGGER_SOURCE_EXTERNAL
  - The pulse is started with a trigger after the delay time specified by the IVIRFSIGGEN_ATTR_PULSE_EXTERNAL_TRIGGER_DELAY attribute.

Default Value:

IVIRFSIGGEN_VAL_PULSE_TRIGGER_SOURCE_INTERNAL     �    Specifies the width of the output pulse. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_WIDTH attribute.

Units: Seconds

Default Value: 50.0e-6 seconds     �    Enables pulse gating. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_GATING_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

Default Value: VI_FALSE   G�-   �  �    Instrument Handle                HJ#����  �    Status                           OI 9  � �    Trigger Source                   Q� 9 � �  �    Pulse Width                      R` 9� �       Gating Enabled                         	                      nInternal IVIRFSIGGEN_VAL_PULSE_TRIGGER_SOURCE_INTERNAL External IVIRFSIGGEN_VAL_PULSE_TRIGGER_SOURCE_EXTERNAL    50.0e-6    True VI_TRUE False VI_FALSE    m    This function sets the double pulse state and delay for the pulse generator within the RF signal generator.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the delay of the second pulse. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_DOUBLE_DELAY attribute.

Units: Seconds

Default Value: 0.0     �    Enables double pulse mode. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_DOUBLE_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

Default Value: VI_FALSE   UE-   �  �    Instrument Handle                V#����  �    Status                           ] 9� �  �    Delay                            ]� 6 Q �       Enabled                                	           0.0    True VI_TRUE False VI_FALSE    j    This function configures the output and polarity of the pulse generator within the RF signal generator.      �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    [    Specifies the polarity of the output signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_OUTPUT_POLARITY attribute.

Defined Values:
IVIRFSIGGEN_VAL_PULSE_OUTPUT_POLARITY_NORMAL 
  - Normal polarity

IVIRFSIGGEN_VAL_PULSE_OUTPUT_POLARITY_INVERSE
  - Inverted polarity

Default Value:
IVIRFSIGGEN_VAL_PULSE_OUTPUT_POLARITY_NORMAL     �    Enables the pulse generator external output. The driver uses this value to set the IVIRFSIGGEN_ATTR_PULSE_OUTPUT_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

Default Value: VI_FALSE   _�-   �  �    Instrument Handle                `�#����  �    Status                           g� 9  � �    Polarity                         i 9� �       Enabled                                	                      jNormal IVIRFSIGGEN_VAL_PULSE_OUTPUT_POLARITY_NORMAL Inverse IVIRFSIGGEN_VAL_PULSE_OUTPUT_POLARITY_INVERSE    True VI_TRUE False VI_FALSE    N    This function configures the signal generator sweep mode and trigger source.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    ;    Specifies the sweep mode applied to the output signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_SWEEP_MODE attribute.

Defined Values:

IVIRFSIGGEN_VAL_SWEEP_MODE_NONE - The RF output of
   the signal generator is a non-swept signal (Continuous
   Wave) using the frequency and power/level specified in 
   the IviRFSigGen_ConfigureRF function.

IVIRFSIGGEN_VAL_SWEEP_MODE_FREQUENCY_SWEEP - The signal 
   generator sweeps the RF output signal's frequency 
   in an analog form (non-stepped).

IVIRFSIGGEN_VAL_SWEEP_MODE_POWER_SWEEP - The signal 
   generator sweeps the RF output signal's power 
   in an analog form (non-stepped).

IVIRFSIGGEN_VAL_SWEEP_MODE_FREQUENCY_STEP - The 
   signal generator sweeps the RF output signals frequency in 
   steps.

IVIRFSIGGEN_VAL_SWEEP_MODE_POWER_STEP - The signal 
   generator sweeps the RF output signals power level in steps.

IVIRFSIGGEN_VAL_SWEEP_MODE_LIST - The signal
   generator uses two lists with frequency and power level
   values to sweep the RF output signals.

Default Value: IVIRFSIGGEN_VAL_SWEEP_MODE_NONE    A    Specifies the trigger used to start a sweep operation. The driver uses this value to set the IVIRFSIGGEN_ATTR_SWEEP_TRIGGER_SOURCE attribute.

Defined Values:

IVIRFSIGGEN_VAL_SWEEP_TRIGGER_SOURCE_IMMEDIATE - The
   sweep system does not wait for a trigger of any kind, so it
   is running continuously.

IVIRFSIGGEN_VAL_SWEEP_TRIGGER_SOURCE_EXTERNAL - The
   sweep is started with an external signal.

IVIRFSIGGEN_VAL_SWEEP_TRIGGER_SOURCE_SOFTWARE - The
   sweep is started with a software programmable trigger.

Default Value: IVIRFSIGGEN_VAL_SWEEP_TRIGGER_SOURCE_IMMEDIATE   k�-   �  �    Instrument Handle                l[#����  �    Status                           sZ 9  � �    Mode                             w� 9� � �    Trigger Source                         	                     "None IVIRFSIGGEN_VAL_SWEEP_MODE_NONE Frequency Sweep IVIRFSIGGEN_VAL_SWEEP_MODE_FREQUENCY_SWEEP Power Sweep IVIRFSIGGEN_VAL_SWEEP_MODE_POWER_SWEEP Frequency Step IVIRFSIGGEN_VAL_SWEEP_MODE_FREQUENCY_STEP Power Step IVIRFSIGGEN_VAL_SWEEP_MODE_POWER_STEP List IVIRFSIGGEN_VAL_SWEEP_MODE_LIST               �Immediate IVIRFSIGGEN_VAL_SWEEP_TRIGGER_SOURCE_IMMEDIATE External IVIRFSIGGEN_VAL_SWEEP_TRIGGER_SOURCE_EXTERNAL Software IVIRFSIGGEN_VAL_SWEEP_TRIGGER_SOURCE_SOFTWARE    �    This function configures the start and stop frequencies for a frequency sweep. If the stop frequency is less than the start frequency, the frequency decreases during the sweep     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Specifies the start frequency of the sweep. If the stop frequency is less than the start frequency, the frequency decreases during the sweep. The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_SWEEP_START attribute.

Units: Hertz

Default Value: 100.0 KHz        Specifies the stop frequency of the sweep. If the stop frequency is less than the start frequency, the frequency decreases during the sweep.  The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_SWEEP_STOP attribute.

Units: Hertz

Default Value: 100.0 MHz   }j-   �  �    Instrument Handle                ~*#����  �    Status                           �) 9  �  �    Start                            �@ 9� �  �    Stop                                   	           100.0e3    100.0e6       This function configures the center frequency and span for a frequency sweep. This function modifies the start and stop attributes as follows:

IVIRFSIGGEN_ATTR_FREQUENCY_STEP_START = Center - Span / 2
IVIRFSIGGEN_ATTR_FREQUENCY_STEP_STOP  = Center + Span / 2
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     ^    Specifies the center frequency for a frequency sweep.

Units: Hertz

Default Value: 50.0 MHz     ]    Specifies the frequency span for a frequency sweep.

Units: Hertz

Default Value: 500.0 KHz   �^-   �  �    Instrument Handle                �#����  �    Status                           � 9  �  �    Center                           �� 9� �  �    Span                                   	           50.0e6    500.0e3    @    This function configures the duration of one frequency sweep.      �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the duration of one sweep from start to stop frequency. The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_SWEEP_TIME attribute.

Units: Seconds

Default Value: 1.0 s   �)-   �  �    Instrument Handle                ��#����  �    Status                           �� 9 � �  �    Time                                   	           1.0    �    This function configures the start and stop power for a power sweep. If the stop power is less than the start power, the power decreases in value during the sweep.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Specifies the start power of the sweep. If the stop power is less than the start power, the power decreases in value during the sweep. The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_SWEEP_START attribute.

Units: dBm

Default Value: -50.0 dBm        Specifies the stop power of the sweep. If the stop power is less than the start power, the power decreases in value during the sweep.  The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_SWEEP_STOP attribute.

Units: dBm

Default Value: -10.0 dBm   �-   �  �    Instrument Handle                ��#����  �    Status                           �� 9  �  �    Start                            �� 9� �  �    Stop                                   	           -50.0    -10.0    <    This function configures the duration of one power sweep.      �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the duration of one sweep from start to stop power. The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_SWEEP_TIME attribute.

Units: Seconds

Default Value: 1.0 s   �-   �  �    Instrument Handle                ��#����  �    Status                           �� 9 � �  �    Time                                   	           1.0       This function configures the settings that control the step frequencies of the generator's RF output signal. These settings are start and stop frequency, step size, and lin/log scaling. If the stop frequency is less than the start frequency, the frequency decreases during the sweep.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Specifies the start frequency of the stepped sweep. If the stop frequency is less than the start frequency, the frequency decreases during the sweep.  The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_START attribute.

Units: Hertz

Default Value: 500.0 KHz        Specifies the stop frequency of the stepped sweep. If the stop frequency is less than the start frequency, the frequency decreases during the sweep.  The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_STOP attribute.

Units: Hertz

Default Value: 5.0 MHz    V    Specifies the spacing of the steps. The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_SCALING attribute.

Defined Values:
IVIRFSIGGEN_VAL_FREQUENCY_STEP_SCALING_LINEAR - Linear scaling

IVIRFSIGGEN_VAL_FREQUENCY_STEP_SCALING_LOGARITHMIC - Logarithmic scaling

Default Value: IVIRFSIGGEN_VAL_FREQUENCY_STEP_SCALING_LINEAR    �    Specifies the step size. The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_SIZE attribute.

Units: 
The units are Hz when the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_SCALING attribute is set to IVIRFSIGGEN_VAL_FREQUENCY_STEP_SCALING_LINEAR
The value is unitless (factor) when the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_SCALING attribute is set to IVIRFSIGGEN_VAL_FREQUENCY_STEP_SCALING_LOGARITHMIC.

Default Value: 100 KHz   �y-   �  �    Instrument Handle                �9#����  �    Status                           �8 9  �  �    Start                            �W 9� �  �    Stop                             �r �  � �    Scaling                          �� �� �  �    Step Size                              	           500.0e3    5.0e6               tLinear IVIRFSIGGEN_VAL_FREQUENCY_STEP_SCALING_LINEAR Logarithmic IVIRFSIGGEN_VAL_FREQUENCY_STEP_SCALING_LOGARITHMIC    100.0e3    =    This function configures how the frequency sweep advances.      �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    $    Specify if the frequency sweep advances after the next trigger event (VI_TRUE) or immediately after the dwell time ends (VI_FALSE). The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_SINGLE_STEP_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

Default Value: VI_FALSE    y    Specify the duration time of one step. Dwell time starts immediate after a trigger or the next step; no settling time is added. The driver uses this value to set the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_DWELL attribute.

Units: Seconds

Default Value: 2.0 ms

Note:

This attribute is ignored if the IVIRFSIGGEN_ATTR_FREQUENCY_STEP_SINGLE_STEP_ENABLED attribute is set to VI_TRUE.   ��-   �  �    Instrument Handle                �z#����  �    Status                           �y 9 P �       Single Enabled                   ʥ 9� �  �    Dwell                                  	           True VI_TRUE False VI_FALSE    2.0e-3    T    This function resets the current frequency step to the frequency step start value.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   ͏-   �  �    Instrument Handle                �O#����  �    Status                                 	           �    This function configures the settings that control the power steps of the generator's RF output signal. These settings are start and stop power and step size. If the stop power is less than the start power, the power decreases in value during the sweep     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Specifies the start power of the stepped sweep. If the stop power is less than the start power, the power decreases in value during the sweep. The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_STEP_START attribute.

Units: dBm

Default Value: -50.0        Specifies the start power of the stepped sweep. If the stop power is less than the start power, the power decreases in value during the sweep. The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_STEP_STOP attribute.

Units: dBm

Default Value: -10.0     �    Specifies the step size. The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_STEP_SIZE attribute.

Units: dBm

Default Value: 0.1 dBm   ��-   �  �    Instrument Handle                ׎#����  �    Status                           ލ 9  �  �    Start                            ߚ 9 � �  �    Stop                             � 9� �  �    Step Size                              	           -50.0    -10.0    0.1    9    This function configures how the power sweep advances.      �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    "    Specifies if the frequency sweep advances after the next trigger event (VI_TRUE) or immediately after the dwell time ends (VI_FALSE). The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_STEP_SINGLE_STEP_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

Default Value: VI_FALSE    s    Specifies the duration time of one step. Dwell time starts immediate after a trigger or the next step; no settling time is added. The driver uses this value to set the IVIRFSIGGEN_ATTR_POWER_STEP_DWELL attribute.

Units: Seconds

Default Value: 2.0 ms

Note:

This attribute is ignored if the IVIRFSIGGEN_ATTR_POWER_STEP_SINGLE_STEP_ENABLED attribute is set to VI_TRUE.   �-   �  �    Instrument Handle                �q#����  �    Status                           �p 9 P �       Single Enabled                   � 9� �  �    Dwell                                  	           True VI_TRUE False VI_FALSE    2.0e-3    L    This function resets the current power step to the power step start value.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   �v-   �  �    Instrument Handle                �6#����  �    Status                                 	           9    This function creates a named list of frequency values.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     8    The name of the list to be created.

Default Value: ""     ;    The number of values in the list array.

Default Value: 0     �    Pass the array of frequency values to become elements of the list. The array must have at least as many elements as the value in the Length parameter.

Units: Hertz   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� 9  �  �    Name                             �� 9 � �  �    Length                           �2 9� �  �    Frequency                              	           ""    0        5    This function creates a named list of power values.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     8    The name of the list to be created.

Default Value: ""     ;    The number of values in the list array.

Default Value: 0     �    Pass the array of power values to become elements of the list. The array must have at least as many elements as the value in the Length parameter.

Units: dBm
   E-   �  �    Instrument Handle                #����  �    Status                           	 9  �  �    Name                             	D 9 � �  �    Length                           	� 9� �  �    Power                                  	           ""    0    0.0    C    This function creates a named list of frequency and power values.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     8    The name of the list to be created.

Default Value: ""     ;    The number of values in the list array.

Default Value: 0     �    Pass the array of frequency values to become elements of the list. The array must have at least as many elements as the value in the Length parameter.

Units: Hertz
     �    Pass the array of power values to become elements of the list. The array must have at least as many elements as the value in the Length parameter.

Units: dBm
   �-   �  �    Instrument Handle                f#����  �    Status                           e 9  �  �    Name                             � 9� �  �    Length                           � �  �  �    Frequency                        � �� �  �    Power                                  	           ""    0            �    This function sets a named list to be the active list.  Create list names using the following functions:  IviRFSigGen_CreateFrequencyList, IviRFSigGen_CreatePowerList, or IviRFSigGen_CreateFrequencyPowerList.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specify the name of the list to make this list active. The name must be one of the lists created. The driver uses this value to set the IVIRFSIGGEN_ATTR_LIST_SELECTED_NAME attribute.

Default Value: ""   {-   �  �    Instrument Handle                ;#����  �    Status                           : 9 � �  �    Name                                   	           ""    �    This function deletes all lists from the pool of defined lists.  The following functions create list names: IviRFSigGen_CreateFrequencyList, IviRFSigGen_CreatePowerList, or IviRFSigGen_CreateFrequencyPowerList.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   !�-   �  �    Instrument Handle                "^#����  �    Status                                 	           7    This function configures how list stepping advances.      �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies if the list step advances after the next trigger event (VI_TRUE) or immediately after the dwell time ends (VI_FALSE).


Valid Values: 

VI_TRUE - The list advances when the next trigger event occurs.
VI_FALSE - The list will advance immediately after the dwell time ends.

The driver uses this value to set the IVIRFSIGGEN_ATTR_LIST_SINGLE_STEP_ENABLED attribute.

Default Value: VI_FALSE     �    Specifies the duration time of one step. The driver uses this value to set the IVIRFSIGGEN_ATTR_LIST_DWELL attribute.

Units: Seconds

Default Value: 2.0 ms
Notes:

(1) This attribute is ignored if List Single Step Enabled is set to VI_TRUE.   *-   �  �    Instrument Handle                *�#����  �    Status                           1� 9 P �       Single Step Enabled              3m 9� �  �    Dwell                                  	           True VI_TRUE False VI_FALSE    2.0e-3    A    This function resets the current list to the first entry value.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   5�-   �  �    Instrument Handle                6~#����  �    Status                                 	           a    This function configures the ALC (Automatic Level Control) of the signal generator's RF output.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the source of the controlling voltage for the Automatic Level Control. The RF level at the sensor point is held constant.  The driver uses this value to set the IVIRFSIGGEN_ATTR_ALC_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_ALC_SOURCE_INTERNAL
  - The ALC is controlled by an internal measurement source.

IVIRFSIGGEN_VAL_ALC_SOURCE_EXTERNAL
  - The ALC is controlled by an external voltage.

Default Value: IVIRFSIGGEN_VAL_ALC_SOURCE_INTERNAL    b    Specifies the bandwidth of Automatic Level Control (ALC). Narrow bandwidth impoves noise and allows AM with modulation frequencies beyond bandwidth frequency. The value is coerced to reflect the ability of the current RF signal generator. The driver uses this value to set the IVIRFSIGGEN_ATTR_ALC_BANDWIDTH attribute.

Units: Hertz

Default Value: 0.0   >`-   �  �    Instrument Handle                ? #����  �    Status                           F 9  � �    Source                           G� 9� �  �    Bandwidth                              	                      ZInternal IVIRFSIGGEN_VAL_ALC_SOURCE_INTERNAL External IVIRFSIGGEN_VAL_ALC_SOURCE_EXTERNAL    0.0    G    This function configures the signal generator's reference oscillator.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the reference frequency source used to generate the exact RF output frequency. The driver uses this value to set the IVIRFSIGGEN_ATTR_REFERENCE_OSCILLATOR_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL
 - The internal reference oscillator is used.

IVIRFSIGGEN_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL
 - An external reference oscillator is used.

Default Value: IVIRFSIGGEN_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL    t    Specifies the frequency of the external signal, which is used as reference for internal RF frequency generation. The driver uses this value to set the IVIRFSIGGEN_ATTR_REFERENCE_OSCILLATOR_EXTERNAL_FREQUENCY attribute.

Units: Hertz

Default Value: 10.0E6

Note: 
This value is used only if the IVIRFSIGGEN_ATTR_REFERENCE_OSCILLATOR_SOURCE attribute is set to External.    K-   �  �    Instrument Handle                K�#����  �    Status                           R� 9  � �    Source                           T� 9� �  �    Frequency                              	                      |Internal IVIRFSIGGEN_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL External IVIRFSIGGEN_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL    10.0E6    h    This function configures the signal generator to apply IQ (vector) modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Enables IQ (vector) modulation of the output RF signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

Default Value: VI_FALSE   X-   �  �    Instrument Handle                X�#����  �    Status                           _� 9 �       IQ Enabled                             	           True VI_TRUE False VI_FALSE    h    This function configures the signal generator to apply IQ (vector) modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the source of the signal that the signal generator uses for IQ modulation. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_SOURCE attribute.

Defined Values:

IVIRFSIGGEN_VAL_IQ_SOURCE_DIGITAL_MODULATION_BASE - The signal
   generator uses the internally generated digital modulation
   signal to apply IQ modulation to the output RF signal.

IVIRFSIGGEN_VAL_IQ_SOURCE_CDMA_BASE - The signal generator uses 
   the internally generated CDMA signal to apply IQ
   modulation to the output RF signal.

IVIRFSIGGEN_VAL_IQ_SOURCE_TDMA_BASE - The signal generator uses
   the internally generated TDMA signal to apply IQ
   modulation to the output RF signal.

IVIRFSIGGEN_VAL_IQ_SOURCE_EXTERNAL - The signal
   generator uses data from an external source for IQ
   modulation.

IVIRFSIGGEN_VAL_IQ_SOURCE_ARB_GENERATOR - The signal
   generator uses the internally generated Arb signal to apply
   IQ modulation to the output RF signal.

Default Value: IVIRFSIGGEN_VAL_IQ_SOURCE_EXTERNAL    }    Enables the inverse phase rotation of the IQ signal by swapping the I and Q inputs. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_SWAP_ENABLED attribute.

Valid Values: 

VI_TRUE - The RF signal generator applies non-inverse phase rotation of the IQ signal.

VI_FALSE - The RF signal generator applies inverse phase rotation of the IQ signal.

Default Value: VI_FALSE   a�-   �  �    Instrument Handle                b�#����  �    Status                           i� 9  � �    Source                           m| 9� �       Swap Enabled                           	                    Digital Modulation Base IVIRFSIGGEN_VAL_IQ_SOURCE_DIGITAL_MODULATION_BASE CDMA Base IVIRFSIGGEN_VAL_IQ_SOURCE_CDMA_BASE TDMA Base IVIRFSIGGEN_VAL_IQ_SOURCE_TDMA_BASE External IVIRFSIGGEN_VAL_IQ_SOURCE_EXTERNAL ARB Generator IVIRFSIGGEN_VAL_IQ_SOURCE_ARB_GENERATOR    True VI_TRUE False VI_FALSE    ,    This function calibrates the IQ modulator.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   qO-   �  �    Instrument Handle                r#����  �    Status                                 	           s    This function enables the IQ (vector) modulation to allow controlled impairment for test or external corrections.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    `    Enables IQ impairment. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_IMPAIRMENT_ENABLED attribute.

Valid Values: VI_TRUE; VI_FALSE

When set to VI_TRUE, the following impairment attributes are applied:
 
IVIRFSIGGEN_ATTR_IQ_I_OFFSET
IVIRFSIGGEN_ATTR_IQ_I_OFFSET
IVIRFSIGGEN_ATTR_IQ_RATIO
IVIRFSIGGEN_ATTR_IQ_SKEW

Default Value: VI_FALSE   z-   �  �    Instrument Handle                z�#����  �    Status                           �� 9 �       IQ Impairment Enabled                  	           True VI_TRUE False VI_FALSE    �    This function configures the settings that simulate or correct impairment for the signal generator's IQ modulation. These settings are only used if the IVIRFSIGGEN_ATTR_IQ_IMPAIRMENT_ENABLED attribute is set to VI_TRUE.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies an origin offset voltage to the I signal. The range of allowable values is -100% to +100%. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_I_OFFSET attribute.

Units: Percent (%)

Default Value: 0.0     �    Specifies an origin offset voltage to the Q signal. The range of allowable values is -100% to +100%. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_Q_OFFSET attribute.

Units: Percent (%)

Default Value: 0.0     �    Specifies the gain imbalance between the I and Q channels. For no imbalance this value is set to 0 %. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_RATIO attribute.

Units: Percent (%)

Default Value: 0.0     �    Specifies the adjustment of the phase angle between the I and Q vectors. If this skew is zero, the phase angle is 90 degrees. The driver uses this value to set the IVIRFSIGGEN_ATTR_IQ_SKEW attribute.

Units: Degrees

Default Value: 0.0   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� 9  �  �    I Offset                         �� 9� �  �    Q Offset                         �d �  �  �    Ratio                            �F �� �  �    Skew                                   	           0.0    0.0    0.0    0.0    e    This function configures the ARB generator by specifying the sample frequency and filter frequency.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the sample frequency. The waveform is generated with this clock frequency. The driver uses this value to set the IVIRFSIGGEN_ATTR_ARB_CLOCK_FREQUENCY attribute.

Units: Hertz

Default Value: 100.0 MHz    ?    Specify the filter frequency which is the cut-off frequency of the low pass filter used for anti aliasing the output waveform. The filter frequency normally is lower than the clock frequency.
The driver uses this value to set the IVIRFSIGGEN_ATTR_ARB_FILTER_FREQUENCY attribute.

Units: Hertz

Default Value: 10.0 KHz   �-   �  �    Instrument Handle                ��#����  �    Status                           �� 9  �  �    Clock Frequency                  �� 9� �  �    Filter Frequency                       	           100.0E6    10.0e3    X    This function stores the transmitted waveform in the drivers's or instrument's memory.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     9    Pass the name the waveform to write.

Default Value: ""     E    Pass the number of samples in both I and Q array.

Default Value: 0     �    Pass the array containing the I part of the waveform.

You must normalize the data points in the array to be between -1.00 and +1.00 of the full I range.


Default Value: None        Set the value to VI_TRUE to write more data. To complete the waveform, use the same Name for the next data. Set the value to VI_FALSE when there is no more data to write.

Valid Values: 
  VI_FALSE - No more data
  VI_TRUE  - More data

Default Value: No more data (VI_FALSE)     �    Pass the array containing the Q part of the waveform. 


You must normalize the data points in the array to be between -1.00 and +1.00 of the full Q range.


Default Value: None   �M-   �  �    Instrument Handle                �#����  �    Status                           � 9  �  �    Name                             �M 9 � �  �    Number of Samples                �� 9� �  �    Data I                           �S �� �       More Data Pending                �p �  �  �    Data Q                                 	           ""    0        True VI_TRUE False VI_FALSE        �    This function sets a named waveform to be the active waveform.  Create arb waveform names using the IviRFSigGen_WriteArbWaveform function.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the selected waveform from the pool of available waveforms. The driver uses this value to set the IVIRFSIGGEN_ATTR_ARB_SELECTED_WAVEFORM attribute.

Default Value: ""   �t-   �  �    Instrument Handle                �4#����  �    Status                           �3 9 � �  �    Name                                   	           ""    @    This function deletes all the currently defined arb waveforms.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   ��-   �  �    Instrument Handle                ��#����  �    Status                                 	           �    This function returns the arb generator settings that are related to creating arbitrary waveforms. These attributes are the maximum number of waveforms, waveform quantum, minimum waveform size, and maximum waveform size.
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Returns the maximum number of waveforms the instrument can hold in the memory. The number may be dependent on the length of the waveform already in the pool of waveforms saved in the instrument. The driver returns the value of the IVIRFSIGGEN_ATTR_ARB_MAX_NUMBER_WAVEFORMS attribute.        Returns the waveform quantum where the waveform length is a multiple of this quantum. If the waveform quantum is 1, there is no restriction on the waveform length other than min and max size.  The driver returns value of the IVIRFSIGGEN_ATTR_ARB_WAVEFORM_QUANTUM attribute.
    I    Returns the minimum size of the waveform length in number of samples.  The waveform length must be equal or greater than this min size. If the minimum size is 1, there is no restriction on the waveform length other than max size and quantum. The driver returns the value of the IVIRFSIGGEN_ATTR_ARB_WAVEFORM_SIZE_MIN attribute.     �    Returns the maximum waveform length in the number of samples. The waveform length must be equal or less than this maximum size.  The driver returns the value of the IVIRFSIGGEN_ATTR_ARB_WAVEFORM_SIZE_MAX attribute.   �
-   �  �    Instrument Handle                ��#����  �    Status                           �� 9  �  �    Max Number of Waveforms          �� 9� �  �    Waveform Quantum                 �
 �  �  �    Min Waveform Size                �[ �� �  �    Max Waveform Size                      	           
        0    
        0    
        0    
        0    �    This function configures the trigger source for the waveform generation.  The output waveform is generated continuously if the source is immediate.  Otherwise, the output is triggered.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    #    Specifies how the Arb waveform is started. The driver uses this value to set the IVIRFSIGGEN_ATTR_ARB_TRIGGER_SOURCE attribute.

Defined Values:

IVIRFSIGGEN_VAL_ARB_TRIGGER_SOURCE_IMMEDIATE - The
   ARB generator system does not wait for a trigger. The
   ARB runs continuously.

IVIRFSIGGEN_VAL_ARB_TRIGGER_SOURCE_EXTERNAL - The
   sweep is started with an external signal.

IVIRFSIGGEN_VAL_ARB_TRIGGER_SOURCE_SOFTWARE - The
   sweep is started with a software programmable trigger.

Default Value: IVIRFSIGGEN_VAL_ARB_TRIGGER_SOURCE_IMMEDIATE   �-   �  �    Instrument Handle                �?#����  �    Status                           �> 9 � � �    Source                                 	                      �Immediate IVIRFSIGGEN_VAL_ARB_TRIGGER_SOURCE_IMMEDIATE External IVIRFSIGGEN_VAL_ARB_TRIGGER_SOURCE_EXTERNAL Software IVIRFSIGGEN_VAL_ARB_TRIGGER_SOURCE_SOFTWARE    h    This function configures the trigger event to occur on the rising or falling edge of the input signal.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies whether the trigger event occurs on the rising or falling edge of the input signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_ARB_EXTERNAL_TRIGGER_SLOPE attribute.

Defined Values:

IVIRFSIGGEN_VAL_ARB_EXTERNAL_TRIGGER_SLOPE_POSITIVE
   - Enables rising edge triggering.

IVIRFSIGGEN_VAL_ARB_EXTERNAL_TRIGGER_SLOPE_NEGATIVE
   - Enables falling edge triggering.

Default Value: IVIRFSIGGEN_VAL_ARB_EXTERNAL_TRIGGER_SLOPE_POSITIVE   �8-   �  �    Instrument Handle                ��#����  �    Status                           �� 9 � � �    Slope                                  	                      zPositive IVIRFSIGGEN_VAL_ARB_EXTERNAL_TRIGGER_SLOPE_POSITIVE Negative IVIRFSIGGEN_VAL_ARB_EXTERNAL_TRIGGER_SLOPE_NEGATIVE   n    This function returns the specific driver defined DigitalModulationBase standard name that corresponds to the one-based index specified by the Index parameter.  If you pass in a value for the Index parameter that is less than one or greater than the value of the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_STANDARD_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.

Note:  For an instrument with only one DigitalModulationBase standard, i.e. the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_STANDARD_COUNT attribute is one, the driver may return an empty string.
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     T    Specifies the index of the DigitalModulationBase Name to return.

Default Value: 0     C    Specify the buffer size for the Name parameter.

Default Value: 0     @    The DigitalModulationBase name that corresponds to the Index.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   �s-   �  �    Instrument Handle                �3 9  �  �    Index                            � 9 � �  �    Name Buffer Size                 �� 9� �  �    Name                             �"#����  �    Status                                 0    0    	            	          �    This function specifies the actual standard used by the instrument.  To obtain a list of available standards, call the IviRFSigGen_GetDigitalModulationBaseStandardName function.  Many instrument settings are affected by selecting an instrument standard.  These settings include: coding, mapping, symbol rate or bit clock frequency, filter together with the associated filter parameters, and FSK deviation or ASK depth (in the case of FSK or ASK modulation).     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Specifies the standard to be used by the instrument. The driver uses this value to set the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_SELECTED_STANDARD attribute.

Default Value: ""
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   �#-   �  �    Instrument Handle                �� 9 � �  �    Name                             �#����  �    Status                                 ""    	           B    This function configures the DigitalModulationBase clock source.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    5    Specifies the source of the clock signal used to generate the digital modulation according to the selected standard. The driver uses this value to set the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_CLOCK_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_CLOCK_SOURCE_INTERNAL
  - The internal clock generator is used.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_CLOCK_SOURCE_EXTERNAL
  - A connected external clock generator (bit or symbol clock frequency) is used.

Default Value:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_CLOCK_SOURCE_INTERNAL    �    Specifies the type of the external clock signal used to generate the digital modulation. This value is used only if the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_CLOCK_SOURCE attribute is set to External. The driver uses this value to set the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_EXTERNAL_CLOCK_TYPE attribute.

Defined Values:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_EXTERNAL_CLOCK_TYPE_BIT
  - The external clock frequency is equal to the bit clock frequency of the digital modulation.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_EXTERNAL_CLOCK_TYPE_SYMBOL
  - The external clock frequency is equal to the symbol clock frequency of the digital modulation.

Default Value:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_EXTERNAL_CLOCK_TYPE_BIT

   ��-   �  �    Instrument Handle                �_#����  �    Status                           ^ 9  � �    Source                           � 9� � �    Type                                   	                      �Internal IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_CLOCK_SOURCE_INTERNAL External IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_CLOCK_SOURCE_EXTERNAL               �Bit IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_EXTERNAL_CLOCK_TYPE_BIT Symbol IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_EXTERNAL_CLOCK_TYPE_SYMBOL    M    This function configures the source of the data for the digital modulation.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    )    Specifies the source of data. The data is used to modulate the RF signal according to the standard selected with the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_SELECTED_STANDARD attribute. The driver uses this value to set the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_DATA_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_DATA_SOURCE_EXTERNAL
  - The data from an external device connected to the instrument is used.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_DATA_SOURCE_PRBS
  - The internal PRBS (Pseudo Random Binary Sequence) generator is used as data source.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_DATA_SOURCE_BIT_SEQUENCE
  - A constant bit sequence is used as data source and repeated continuously.

Default Value:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_DATA_SOURCE_EXTERNAL   �-   �  �    Instrument Handle                	�#����  �    Status                           � 9 � � �    Source                                 	                      �External IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_DATA_SOURCE_EXTERNAL PRBS IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_DATA_SOURCE_PRBS Bit Sequence IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_DATA_SOURCE_BIT_SEQUENCE    �    This function configures the type of the PRBS used as data for the digital modulation. The setting is used only if IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_DATA_SOURCE is set to PRBS.    3    Specifies the type of the PRBS as defined in the CCITT-V.52 standard. The PRBS (Pseudo Random Binary Sequence) is used only if the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_DATA_SOURCE attribute is set to PRBS. The driver uses this value to set the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_PRBS_TYPE attribute.

Defined Values:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS9
  - Length of PRBS sequence is 2E9-1.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS11
  - Length of PRBS sequence is 2E11-1.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS15
  - Length of PRBS sequence is 2E15-1.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS16
  - Length of PRBS sequence is 2E16-1.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS20
  - Length of PRBS sequence is 2E20-1

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS21
  - Length of PRBS sequence is 2E21-1.

IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS23
  - Length of PRBS sequence is 2E23-1.

Default Value:
IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS9     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   < 9 � � �    Type                             w-   �  �    Instrument Handle                7#����  �    Status                                       �PRBS9 IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS9 PRBS11 IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS11 PRBS15 IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS15 PRBS16 IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS16 PRBS20 IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS20 PRBS21 IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS21 PRBS23 IVIRFSIGGEN_VAL_DIGITAL_MODULATION_BASE_PRBS_TYPE_PRBS23        	           �    This function creates a bit sequence for use as the digital modulation data. The sequence is repeated continuously. The sequence string consists of binary values (8 bit in 1 char/byte).     =    Pass the name the bit sequence to write.

Default Value: ""     �    Pass the number of bits in the sequence. One char/byte has 8 bits, but the stream of bits does not end necessarily on byte boundaries.

Default Value: 0     r    Pass the array the driver will use as a stream of bits. The size of the array is Bit Count.

Default Value: None        Set the value to VI_TRUE to write more data. To complete the sequence, use the same Name for the next data. Set the value to VI_FALSE when there is no more data to write.

Valid Values: 
  VI_FALSE - No more data
  VI_TRUE  - More data

Default Value: No more data (VI_FALSE)     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   %u 9  �  �    Name                             %� 9� �  �    Bit Count                        &\ �  �  �    Sequence                         &� �� �       More Data Pending                '�-   �  �    Instrument Handle                (�#����  �    Status                             ""    0        True VI_TRUE False VI_FALSE        	              This function sets a bit sequence to be used as digital modulation data. Create bit sequences using the IviRFSigGen_WriteDigitalModulationBaseBitSequence function. The bit sequence is set only if the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_DATA_SOURCE attribute is set to BitSequence.    N    Specifies name of the bit sequence (stream) used as data for digital modulation. The sequence is used only if the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_DATA_SOURCE attribute is set to Bit Sequence. The driver uses this value to set the IVIRFSIGGEN_ATTR_DIGITAL_MODULATION_BASE_SELECTED_BIT_SEQUENCE attribute.

Default Value: ""
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   2U 9 � �  �    Name                             3�#����  �    Status                           :�-   �  �    Instrument Handle                  ""    	               9    This function clears (deletes) all named bit sequences.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   <`#����  �    Status                           C_-   �  �    Instrument Handle                  	              %    This function returns the specific driver defined CDMA standard name that corresponds to the one-based index specified by the Index parameter.  If you pass in a value for the Index parameter that is less than one or greater than the value of the IVIRFSIGGEN_ATTR_CDMA_STANDARD_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.

Note:  For an instrument with only one CDMA standard, i.e. the IVIRFSIGGEN_ATTR_CDMA_STANDARD_COUNT attribute is one, the driver may return an empty string.     L    Specifies the index of the CDMA Standard Name to return.

Default Value: 0     C    Specify the buffer size for the Name parameter.

Default Value: 0     8    The CDMA standard name that corresponds to the Index.
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   F� 9  �  �    Index                            G 9 � �  �    Name Buffer Size                 Ge 9� �  �    Name                             G�-   �  �    Instrument Handle                He#����  �    Status                             0    0    	                	          _    This function specifies the standard used by the instrument. To obtain a list of available standards, call the IviRFSigGen_GetCDMAStandardName function.  Many instrument settings are affected by selecting an instrument standard.  These settings include: modulation type, bit clock frequency and filter together with the associated filter parameters.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specify the standard to be used by the instrument. The driver uses this value to set the IVIRFSIGGEN_ATTR_CDMA_SELECTED_STANDARD attribute.

Default Value: ""
   Q�-   �  �    Instrument Handle                R�#����  �    Status                           Y� 9 � �  �    Name                                   	           ""    1    This function configures the CDMA clock source.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the source of the clock signal used to generate the digital modulation according to the selected standard. The driver uses this value to set the IVIRFSIGGEN_ATTR_CDMA_CLOCK_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_CDMA_CLOCK_SOURCE_INTERNAL
  - The internal clock generator is used.

IVIRFSIGGEN_VAL_CDMA_CLOCK_SOURCE_EXTERNAL
  - A connected external clock generator (bit or symbol clock frequency) is used.

Default Value:
IVIRFSIGGEN_VAL_CDMA_CLOCK_SOURCE_INTERNAL   [P-   �  �    Instrument Handle                \#����  �    Status                           c 9 � � �    Source                                 	                      hInternal IVIRFSIGGEN_VAL_CDMA_CLOCK_SOURCE_INTERNAL External IVIRFSIGGEN_VAL_CDMA_CLOCK_SOURCE_EXTERNAL    w    This function configures the CDMA trigger source for starting or synchronizing the generation of the channel codings.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    z    Specifies the source of the trigger signal that starts the channel coding generation. The driver uses this value to set the IVIRFSIGGEN_ATTR_CDMA_TRIGGER_SOURCE attribute.

Defined Values:

IVIRFSIGGEN_VAL_CDMA_TRIGGER_SOURCE_IMMEDIATE - The
   CDMA generator system does not wait for a trigger. 
   Each channel coding is run continuously.

IVIRFSIGGEN_VAL_CDMA_TRIGGER_SOURCE_EXTERNAL - Each
   channel coding is started with an external signal.

IVIRFSIGGEN_VAL_CDMA_TRIGGER_SOURCE_SOFTWARE - Each
   channel coding is started with a software programmable
   trigger.

Default Value: IVIRFSIGGEN_VAL_CDMA_TRIGGER_SOURCE_IMMEDIATE   f�-   �  �    Instrument Handle                ge#����  �    Status                           nd 9 � � �    Source                                 	                      �Immediate IVIRFSIGGEN_VAL_CDMA_TRIGGER_SOURCE_IMMEDIATE External IVIRFSIGGEN_VAL_CDMA_TRIGGER_SOURCE_EXTERNAL Software IVIRFSIGGEN_VAL_CDMA_TRIGGER_SOURCE_SOFTWARE    �    This function configures the trigger event to occur on the rising or falling edge of the input signal. This setting is used only if IVIRFSIGGEN_ATTR_CDMA_TRIGGER_SOURCE is set to External.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies whether the trigger event occurs on the rising or falling edge of the input signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_CDMA_EXTERNAL_TRIGGER_SLOPE attribute.

Defined Values:

IVIRFSIGGEN_VAL_CDMA_EXTERNAL_TRIGGER_SLOPE_POSITIVE
   - Enables rising edge triggering.

IVIRFSIGGEN_VAL_CDMA_EXTERNAL_TRIGGER_SLOPE_NEGATIVE
   - Enables falling edge triggering.

Default Value: IVIRFSIGGEN_VAL_CDMA_EXTERNAL_TRIGGER_SLOPE_POSITIVE   s-   �  �    Instrument Handle                s�#����  �    Status                           z� 9 � � �    Slope                                  	                      |Positive IVIRFSIGGEN_VAL_CDMA_EXTERNAL_TRIGGER_SLOPE_POSITIVE Negative IVIRFSIGGEN_VAL_CDMA_EXTERNAL_TRIGGER_SLOPE_NEGATIVE   -    This function returns the specific driver defined CDMA test model name that corresponds to the one-based index specified by the Index parameter.  If you pass in a value for the Index parameter that is less than one or greater than the value of the IVIRFSIGGEN_ATTR_CDMA_TEST_MODEL_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.

Note:  For an instrument with only one CDMA test model, i.e. the IVIRFSIGGEN_ATTR_CDMA_TEST_MODEL_COUNT attribute is one, the driver may return an empty string.     N    Specifies the index of the CDMA test model name to return.

Default Value: 0     C    Specify the buffer size for the Name parameter.

Default Value: 0     :    The CDMA test model name that corresponds to the Index.
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   � 9  �  �    Index                            �d 9 � �  �    Name Buffer Size                 �� 9� �  �    Name                             ��-   �  �    Instrument Handle                ��#����  �    Status                             0    0    	                	           �    This function specifies the channel coding used for the digital modulation. To obtain a list of available CDMA test models for channel coding, call the IviRFSigGen_GetCDMATestModelName function.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specifies the actual test model used by the instrument. The driver uses this value to set the IVIRFSIGGEN_ATTR_CDMA_SELECTED_TEST_MODEL attribute.

Default Value: ""   ��-   �  �    Instrument Handle                �k#����  �    Status                           �j 9 � �  �    Name                                   	           ""   %    This function returns the specific driver defined TDMA standard name that corresponds to the one-based index specified by the Index parameter.  If you pass in a value for the Index parameter that is less than one or greater than the value of the IVIRFSIGGEN_ATTR_TDMA_STANDARD_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.

Note:  For an instrument with only one CDMA standard, i.e. the IVIRFSIGGEN_ATTR_TDMA_STANDARD_COUNT attribute is one, the driver may return an empty string.     L    Specifies the index of the TDMA Standard Name to return.

Default Value: 0     C    Specify the buffer size for the Name parameter.

Default Value: 0     8    The TDMA standard name that corresponds to the Index.
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   �� 9  �  �    Index                            �O 9 � �  �    Name Buffer Size                 �� 9� �  �    Name                             ��-   �  �    Instrument Handle                ��#����  �    Status                             0    0    	                	          �    This function specifies the standard used by the instrument. To obtain a list of available standards, call the IviRFSigGen_GetTDMAStandardName function.  Many instrument settings are affected by selecting an instrument standard.  These settings include: coding, mapping, symbol rate or bit clock frequency, filter together with the associated filter parameters, and FSK deviation or ASK depth (in case of FSK or ASK modulation).     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    Specify the standard to be used by the instrument. The driver uses this value to set the IVIRFSIGGEN_ATTR_TDMA_SELECTED_STANDARD attribute.

Default Value: ""   �~-   �  �    Instrument Handle                �>#����  �    Status                           �= 9 � �  �    Name                                   	           ""    1    This function configures the TDMA clock source.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the source of the clock signal used to generate the digital modulation according to the selected standard. The driver uses this value to set the IVIRFSIGGEN_ATTR_TDMA_CLOCK_SOURCE attribute.

Defined Values:
IVIRFSIGGEN_VAL_TDMA_CLOCK_SOURCE_INTERNAL
  - The internal clock generator is used.

IVIRFSIGGEN_VAL_TDMA_CLOCK_SOURCE_EXTERNAL
  - A connected external clock generator (bit or symbol clock frequency) is used.

Default Value:
IVIRFSIGGEN_VAL_TDMA_CLOCK_SOURCE_INTERNAL    X    Specifies the type of the external clock signal used to generate the digital modulation. This value is used only if the IVIRFSIGGEN_ATTR_TDMA_CLOCK_SOURCE attribute is set to External.

Type is ignored if Source is set to Internal.

Defined Values:
IVIRFSIGGEN_VAL_TDMA_EXTERNAL_CLOCK_TYPE_BIT
  - The external clock frequency is equal to the bit clock frequency of the digital modulation.

IVIRFSIGGEN_VAL_TDMA_EXTERNAL_CLOCK_TYPE_SYMBOL
  - The external clock frequency is equal to the symbol clock frequency of the digital modulation.

Default Value:
IVIRFSIGGEN_VAL_TDMA_EXTERNAL_CLOCK_TYPE_BIT   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� 9  � �    Source                           �� :� � �    Type                                   	                      hInternal IVIRFSIGGEN_VAL_TDMA_CLOCK_SOURCE_INTERNAL External IVIRFSIGGEN_VAL_TDMA_CLOCK_SOURCE_EXTERNAL               hBit IVIRFSIGGEN_VAL_TDMA_EXTERNAL_CLOCK_TYPE_BIT Symbol IVIRFSIGGEN_VAL_TDMA_EXTERNAL_CLOCK_TYPE_SYMBOL    t    This function configures the TDMA trigger source for starting or synchronizing the generation of the frames/slots.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    ]    Specifies the source of the trigger signal that starts the frame/slots generation.  The driver uses this value to set the IVIRFSIGGEN_ATTR_TDMA_TRIGGER_SOURCE attribute.

Defined Values:

IVIRFSIGGEN_VAL_TDMA_TRIGGER_SOURCE_IMMEDIATE - The
   TDMA generator system does not wait for a trigger. 
   Each frame is run continuously.

IVIRFSIGGEN_VAL_TDMA_TRIGGER_SOURCE_EXTERNAL - Each
   frame is started with an external signal.

IVIRFSIGGEN_VAL_TDMA_TRIGGER_SOURCE_SOFTWARE - Each
   frame is started with a software programmable
   trigger.

Default Value: IVIRFSIGGEN_VAL_TDMA_TRIGGER_SOURCE_IMMEDIATE   �1-   �  �    Instrument Handle                ��#����  �    Status                           �� 9 � � �    Source                                 	                      �Immediate IVIRFSIGGEN_VAL_TDMA_TRIGGER_SOURCE_IMMEDIATE External IVIRFSIGGEN_VAL_TDMA_TRIGGER_SOURCE_EXTERNAL Software IVIRFSIGGEN_VAL_TDMA_TRIGGER_SOURCE_SOFTWARE    �    This function configures the trigger event to occur on the rising or falling edge of the input signal. This setting is used only if IVIRFSIGGEN_ATTR_TDMA_TRIGGER_SOURCE is set to External     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies whether the trigger event occurs on the rising or falling edge of the input signal. The driver uses this value to set the IVIRFSIGGEN_ATTR_TDMA_EXTERNAL_TRIGGER_SLOPE attribute.

Defined Values:

IVIRFSIGGEN_VAL_TDMA_EXTERNAL_TRIGGER_SLOPE_POSITIVE
   - Enables rising edge triggering.

IVIRFSIGGEN_VAL_TDMA_EXTERNAL_TRIGGER_SLOPE_NEGATIVE
   - Enables falling edge triggering.

Default Value: IVIRFSIGGEN_VAL_TDMA_EXTERNAL_TRIGGER_SLOPE_POSITIVE   �|-   �  �    Instrument Handle                �<#����  �    Status                           �; 9 � � �    Slope                                  	                      |Positive IVIRFSIGGEN_VAL_TDMA_EXTERNAL_TRIGGER_SLOPE_POSITIVE Negative IVIRFSIGGEN_VAL_TDMA_EXTERNAL_TRIGGER_SLOPE_NEGATIVE       This function returns the specific driver defined TDMA frame name that corresponds to the one-based index specified by the Index parameter.  If you pass in a value for the Index parameter that is less than one or greater than the value of the IVIRFSIGGEN_ATTR_TDMA_FRAME_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.

Note:  For an instrument with only one TDMA frame, i.e. the IVIRFSIGGEN_ATTR_TDMA_FRAME_COUNT attribute is one, the driver may return an empty string.     I    Specifies the index of the TDMA frame name to return.

Default Value: 0     C    Specify the buffer size for the Name parameter.

Default Value: 0     4    The TDMA frame name that corresponds to the Index.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   �h 9  �  �    Index                            ҹ 9 � �  �    Name Buffer Size                 � 9� �  �    Name                             �@-   �  �    Instrument Handle                � #����  �    Status                             0    0    	                	           �    This function specifies the frame used for framed digital modulation. To obtain a list of available TDMA frames, call the IviRFSigGen_GetTDMAFrameName function.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    ~    Specifies the actual frames/slot used by the instrument. It is selected with one of the names from TDMA Frame Names attribute. The frames/slot are generated only, if TDMA Framing Enabled is set to VI_TRUE. This attribute is ignored if TDMA Framing Enabled is set to VI_FALSE. The driver uses this value to set the IVIRFSIGGEN_ATTR_TDMA_SELECTED_FRAME attribute.

Default Value: ""   ��-   �  �    Instrument Handle                ݘ#����  �    Status                           � 9 � �  �    Name                                   	           ""   �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    C    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type.   
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt32 are dim.  If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""   �-   �  �    Instrument Handle                �e#����  �    Status                           �d � � �  �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     �� =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    B    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box.
  Attributes with data types other than ViReal64 are dim.  If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""
   �-   �  �    Instrument Handle                �#����  �    Status                           	� � � �  �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     � =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    A    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box.
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""   �-   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          !� = � � �    Attribute ID                     ' =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    C    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box.
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""   .-   �  �    Instrument Handle                .�#����  �    Status                           5� � � �  �    Attribute Value                 ���� � ���                                          7� = � � �    Attribute ID                     =A =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    C    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box.
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   DE-   �  �    Instrument Handle                E#����  �    Status                           L � � �  �    Attribute Value                  N =  �  �    Repeated Capability Name         N� = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  
  Attributes with data types other than ViInt32 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   WV-   �  �    Instrument Handle                X#����  �    Status                           _ � � �  �    Attribute Value                  `� =  �  �    Repeated Capability Name         ag = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViReal64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   i-   �  �    Instrument Handle                i�#����  �    Status                           p� � � �  �    Attribute Value                  r� =  �  �    Repeated Capability Name         s = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the   number of bytes in the value, pass a negative number for the Buffer Size parameter.  

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviRFSigGen_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    &    The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value: 512
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                ��#����  �    Status or Required Size          �D � L � �    Attribute Value                  �r =  �  �    Repeated Capability Name         � =� �  �    Buffer Size                      �� = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                  �U =  �  �    Repeated Capability Name         �� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                �H#����  �    Status                           �G � � �  �    Attribute Value                  � =  �  �    Repeated Capability Name         �� = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    @    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt32 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                ��#����  �    Status                            � � �  �    Attribute Value                  �� =  �  �    Repeated Capability Name        ���� � ���                                          �Y = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    B    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViReal64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ̘-   �  �    Instrument Handle                �X#����  �    Status                           �W � � �  �    Attribute Value                  և =  �  �    Repeated Capability Name        ���� � ���                                          � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    B    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �\-   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                  �K =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    D    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �!-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                  � =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    IviRFSigGen attributes do not apply to any repeated capabilities.  Pass VI_NULL or an empty string for this parameter.

Default Value:  ""    D    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                �#����  �    Status                           	� � � �  �    Attribute Value                  � =  �  �    Repeated Capability Name        ���� � ���                                          k = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    l    This function disables all currently enabled modulations (e.g. analog, pulse, IQ, and digital modulation).     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   �-   �  �    Instrument Handle                �#����  �    Status                                 	           J    This function waits until the state of the RF output signal has settled.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
    �    Specifies the maximum time to wait for the output to settle.

If the output does not settle within this time interval, the function returns the IVIRFSIGGEN_ERROR_MAX_TIME_EXCEEDED (0xBFFA2003) error code.

Units: milliseconds

Defined Values:

IVIRFSIGGEN_VAL_MAX_TIME_INFINITE (-1)             IVIRFSIGGEN_VAL_MAX_TIME_IMMEDIATE (0)          

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters or attributes.   Q-   �  �    Instrument Handle                #����  �    Status                           $ 9 � �  �    Max Time                               	           5000    E    This function queries if the RF output signal is currently settled.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     I    Returns VI_TRUE if the output signal is in settled, VI_FALSE otherwise.   '-   �  �    Instrument Handle                '�#����  �    Status                           .� 9 � �  �    Settled                                	           	           �    This function sends a command to trigger the RF signal generator.  Call this function if you set a trigger source to a software trigger value.  Below is a list of attributes and functions which can set the trigger source to a software trigger.

Functions: 
IviRFSigGen_ConfigureArbTriggerSource
IviRFSigGen_ConfigureSweep
IviRFSigGen_ConfigureCDMATriggerSource
IviRFSigGen_ConfigureTDMATriggerSource 

Attributes:
IVIRFSIGGEN_ATTR_ARB_TRIGGER_SOURCE
IVIRFSIGGEN_ATTR_SWEEP_TRIGGER_SOURCE
IVIRFSIGGEN_ATTR_CDMA_TRIGGER_SOURCE
IVIRFSIGGEN_ATTR_TDMA_TRIGGER_SOURCE

Notes:

This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviRFSigGen_error_query function at the conclusion of the sequence.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   3�#����  �    Status                           :�-   �  �    Instrument Handle                  	              &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   =(#����  �    Status                           D'-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   E�#����  �    Status                           L�-   �  �    Instrument Handle                  	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   N�#����  �    Status                           U�-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

    &    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   WZ 9  �  �    Self Test Result                 X� 9 � � ,    Self-Test Message                YR#����  �    Status                           `Q-   �  �    Instrument Handle                  	           	            	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   bu 9  �  �    Instrument Driver Revision       c 9^ �  �    Firmware Revision                c�#����  �    Status                           j�-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   l� 9  �  �    Error Code                       l� 9 � � ,    Error Message                    m�#����  �    Status                           t�-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.      z    Pass the Status parameter that is returned from any of the instrument driver functions.

Default Value:  0  (VI_SUCCESS)     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
         The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   v� 9  �  h    Error Code                       w9 9 � � �    Error Message                    w�#����  �    Status                           ~�-   �  �    Instrument Handle                  0    	            	           VI_NULL    P    This function invalidates the cached values of all attributes for the session.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �O#����  �    Status                           �N-   �  �    Instrument Handle                  	               h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     Z    Returns the C session instrument handle you use to call the specific driver's functions.   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� = � �  �    Specific Driver C Handle               	           	          �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the IVIRFSIGGEN_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   ��#����  �    Status or Required Size          �l-   �  �    Instrument Handle                � � Q � �    Coercion Record                  � 9 � �  �    Buffer Size                        	               	               �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviRFSigGen_GetError or IviRFSigGen_ClearError.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   ��#����  �    Status or Required Size          ��-   �  �    Instrument Handle                �Y 9> �  �    BufferSize                       �9 9 T �  �    Code                             �� � Q � �    Description                        	                   	           	           m    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the InstrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviRFSigGen_GetError function, which occurs when a call to IviRFSigGen_init or IviRFSigGen_InitWithOptions fails.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �r#����  �    Status                           �q-   �  �    Instrument Handle                  	              2    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the IVIRFSIGGEN_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   ��#����  �    Status or Required Size          Ԣ-   �  �    Instrument Handle                �b 9 � �  �    Buffer Size                      �h � Q � �    Interchange Warning                	                   	            A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   ��-   �  �    Instrument Handle                ݉#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviRFSigGen_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviRFSigGen_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviRFSigGen_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
   ��-   �  �    Instrument Handle                �#����  �    Status                                 	          ^    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviRFSigGen_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviRFSigGen_LockSession returns successfully, no other threads can access the instrument session until you call IviRFSigGen_UnlockSession.

Use IviRFSigGen_LockSession and IviRFSigGen_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviRFSigGen_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviRFSigGen_LockSession with a call to IviRFSigGen_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviRFSigGen_LockSession and IviRFSigGen_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviRFSigGen_LockSession.  This allows you to call IviRFSigGen_UnlockSession just once at the end of the function. 
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviRFSigGen_LockSession or IviRFSigGen_UnlockSession in the same function.

The parameter is an input/output parameter.  IviRFSigGen_LockSession and IviRFSigGen_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviRFSigGen_LockSession does not lock the session again.  If the value is VI_FALSE, IviRFSigGen_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviRFSigGen_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviRFSigGen_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviRFSigGen_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviRFSigGen_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviRFSigGen_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviRFSigGen_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    IviRFSigGen_UnlockSession(vi, &haveLock);
    return error;
}   �|#����  �    Status                            {-   �  �    Instrument Handle                ; 9 � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviRFSigGen_LockSession.  Refer to IviRFSigGen_LockSession for additional information on session locks.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviRFSigGen_LockSession or IviRFSigGen_UnlockSession in the same function.

The parameter is an input/output parameter.  IviRFSigGen_LockSession and IviRFSigGen_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviRFSigGen_LockSession does not lock the session again.  If the value is VI_FALSE, IviRFSigGen_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviRFSigGen_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviRFSigGen_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviRFSigGen_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviRFSigGen_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviRFSigGen_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviRFSigGen_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    IviRFSigGen_UnlockSession(vi, &haveLock);
    return error;
}   
�#����  �    Status                           �-   �  �    Instrument Handle                m 9 � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviRFSigGen_close.

(2) After calling IviRFSigGen_close, you cannot use the instrument driver again until you call IviRFSigGen_init or IviRFSigGen_InitWithOptions.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviRFSigGen_error_message function.  To obtain additional information about the error condition, call the IviRFSigGen_GetError function.  To clear the error information from the driver, call the IviRFSigGen_ClearError function.

The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2003  Max Time Exceeded.
BFFA200A  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types         File
---------------------------------------------------------------
3FFA0000 to 3FFA1FFF    IVI Warnings              ivi.h
3FFF0000 to 3FFFFFFF    VISA Warnings             visa.h
3FFC0000 to 3FFCFFFF    VXIPnP Driver Warnings    vpptype.h


BFFA0000 to BFFA1FFF    IVI Errors                ivi.h
BFFF0000 to BFFFFFFF    VISA Errors               visa.h
BFFC0000 to BFFCFFFF    VXIPnP Driver Errors      vpptype.h
     �    The ViSession handle that you obtain from the IviRFSigGen_init or IviRFSigGen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           #�-   �  �    Instrument Handle                  	            ����         �  +1             K.        init                                                                                                                                    ����         ,�  J�             K.        InitWithOptions                                                                                                                         ����         L�  V<             K.        ConfigureRF                                                                                                                             ����         W0  `i             K.        ConfigureALCEnabled                                                                                                                     ����         a7  j,             K.        ConfigureOutputEnabled                                                                                                                  ����         j�  t]             K.        ConfigureAMEnabled                                                                                                                      ����         u+  ~�             K.        ConfigureAMExternalCoupling                                                                                                             ����         �  ��             K.        ConfigureAM                                                                                                                             ����         �  �{             K.        ConfigureFMEnabled                                                                                                                      ����         �I  ��             K.        ConfigureFMExternalCoupling                                                                                                             ����         ��  ��             K.        ConfigureFM                                                                                                                             ����         ��  ��             K.        ConfigurePMEnabled                                                                                                                      ����         ��  �u             K.        ConfigurePMExternalCoupling                                                                                                             ����         ŉ  ��             K.        ConfigurePM                                                                                                                             ����         ��  �{             K.        GetAnalogModulationSourceName                                                                                                           ����         ߪ  �             K.        ConfigurePulseModulationEnabled                                                                                                         ����         ��  ��             K.        ConfigurePulseModulationSource                                                                                                          ����         ��  ��             K.        ConfigurePulseModulationExternalPolarity                                                                                                ����                      K.        ConfigureLFGenerator                                                                                                                    ����         �             K.        GetLFGeneratorName                                                                                                                      ����        � $�             K.        SetActiveLFGenerator                                                                                                                    ����        %� /p             K.        ConfigureLFGeneratorOutput                                                                                                              ����        0z ;i             K.        ConfigurePulseExternalTrigger                                                                                                           ����        <� FC             K.        ConfigurePulseInternalTrigger                                                                                                           ����        F� S             K.        ConfigurePulse                                                                                                                          ����        T� ^d             K.        ConfigurePulseDouble                                                                                                                    ����        _n i�             K.        ConfigurePulseOutput                                                                                                                    ����        kE y�             K.        ConfigureSweep                                                                                                                          ����        |� �V             K.        ConfigureFrequencySweepStartStop                                                                                                        ����        �P ��             K.        ConfigureFrequencySweepCenterSpan                                                                                                       ����        �� ��             K.        ConfigureFrequencySweepTime                                                                                                             ����        �f ��             K.        ConfigurePowerSweepStartStop                                                                                                            ����        �� ��             K.        ConfigurePowerSweepTime                                                                                                                 ����        �T ��             K.        ConfigureFrequencyStepStartStop                                                                                                         ����        �u �&             K.        ConfigureFrequencyStepDwell                                                                                                             ����        �3 �N             K.        ResetFrequencyStep                                                                                                                      ����        �� �>             K.        ConfigurePowerStepStartStop                                                                                                             ����        �p �             K.        ConfigurePowerStepDwell                                                                                                                 ����        �" �5             K.        ResetPowerStep                                                                                                                          ����        �� ��             K.        CreateFrequencyList                                                                                                                     ����         
0             K.        CreatePowerList                                                                                                                         ����        [ @             K.        CreateFrequencyPowerList                                                                                                                ����        �               K.        SelectList                                                                                                                              ����         � )]             K.        ClearAllLists                                                                                                                           ����        )� 4h             K.        ConfigureListDwell                                                                                                                      ����        5u =}             K.        ResetList                                                                                                                               ����        =� Ia             K.        ConfigureALC                                                                                                                            ����        J� V             K.        ConfigureReferenceOscillator                                                                                                            ����        W� `�             K.        ConfigureIQEnabled                                                                                                                      ����        aY o             K.        ConfigureIQ                                                                                                                             ����        q y             K.        CalibrateIQ                                                                                                                             ����        y� �*             K.        ConfigureIQImpairmentEnabled                                                                                                            ����        �� �;             K.        ConfigureIQImpairment                                                                                                                   ����        �� ��             K.        ConfigureArb                                                                                                                            ����        �� �+             K.        WriteArbWaveform                                                                                                                        ����        �� ��             K.        SelectArbWaveform                                                                                                                       ����        �� ��             K.        ClearAllArbWaveforms                                                                                                                    ����        �# �;             K.        QueryArbWaveformCapabilities                                                                                                            ����        ʽ �i             K.        ConfigureArbTriggerSource                                                                                                               ����        �� ��             K.        ConfigureArbExternalTriggerSlope                                                                                                        ����        �� �!             K.        GetDigitalModulationBaseStandardName                                                                                                    ����        �P ��             K.        SelectDigitalModulationBaseStandard                                                                                                     ����        �U �             K.        ConfigureDigitalModulationBaseClockSource                                                                                               ����        � �             K.        ConfigureDigitalModulationBaseDataSource                                                                                                ����        { "6             K.        ConfigureDigitalModulationBasePRBSType                                                                                                  ����        $� /�             K.        WriteDigitalModulationBaseBitSequence                                                                                                   ����        1. ;j             K.        SelectDigitalModulationBaseBitSequence                                                                                                  ����        < D             K.        ClearAllDigitalModulationBaseBitSequences                                                                                               ����        D� Od             K.        GetCDMAStandardName                                                                                                                     ����        P� Zb             K.        SelectCDMAStandard                                                                                                                      ����        [ e              K.        ConfigureCDMAClockSource                                                                                                                ����        f& p�             K.        ConfigureCDMATriggerSource                                                                                                              ����        rH |�             K.        ConfigureCDMAExternalTriggerSlope                                                                                                       ����        }� ��             K.        GetCDMATestModelName                                                                                                                    ����        �� �             K.        SelectCDMATestModel                                                                                                                     ����        �� ��             K.        GetTDMAStandardName                                                                                                                     ����        �� ��             K.        SelectTDMAStandard                                                                                                                      ����        �� ��             K.        ConfigureTDMAClockSource                                                                                                                ����        �� �U             K.        ConfigureTDMATriggerSource                                                                                                              ����        ķ �             K.        ConfigureTDMAExternalTriggerSlope                                                                                                       ����        �G ��             K.        GetTDMAFrameName                                                                                                                        ����        �. �             K.        SelectTDMAFrame                                                                                                                         ����        �� �^             K.        SetAttributeViInt32                                                                                                                     ����        �� �             K.        SetAttributeViReal64                                                                                                                    ����        ! '�             K.        SetAttributeViString                                                                                                                    ����        )G =�             K.        SetAttributeViBoolean                                                                                                                   ����        ?p S�             K.        SetAttributeViSession                                                                                                                   ����        U� f             K.        GetAttributeViInt32                                                                                                                     ����        gD w�             K.        GetAttributeViReal64                                                                                                                    ����        x� ��             K.        GetAttributeViString                                                                                                                    ����        � ��             K.        GetAttributeViBoolean                                                                                                                   ����        �� �>             K.        GetAttributeViSession                                                                                                                   ����        �{ ʡ             K.        CheckAttributeViInt32                                                                                                                   ����        �< �e             K.        CheckAttributeViReal64                                                                                                                  ����        �  �)             K.        CheckAttributeViString                                                                                                                  ����        �� ��             K.        CheckAttributeViBoolean                                                                                                                 ����        � �             K.        CheckAttributeViSession                                                                                                                 ����        R �             K.        DisableAllModulation                                                                                                                    ����        � &             K.        WaitUntilSettled                                                                                                                        ����        &� /#             K.        IsSettled                                                                                                                               ����        /� ;�             K.        SendSoftwareTrigger                                                                                                                     ����        ;� D�             K.        reset                                                                                                                                   ����        Ea M�             K.        ResetWithDefaults                                                                                                                       ����        N3 V~             K.        Disable                                                                                                                                 ����        V� a             K.        self_test                                                                                                                               ����        b kP             K.        revision_query                                                                                                                          ����        lL uE             K.        error_query                                                                                                                             ����        vA �             K.        error_message                                                                                                                           ����        �� �             K.        InvalidateAllAttributes                                                                                                                 ����        �� �             K.        GetSpecificDriverCHandle                                                                                                                ����        �� �             K.        GetNextCoercionRecord                                                                                                                   ����        �� ��             K.        GetError                                                                                                                                ����        �� �1             K.        ClearError                                                                                                                              ����        ȫ ی             K.        GetNextInterchangeWarning                                                                                                               ����        ܀ �             K.        ClearInterchangeWarnings                                                                                                                ����        � �             K.        ResetInterchangeCheck                                                                                                                   ����        � 	2             K.        LockSession                                                                                                                             ����        	� d             K.        UnlockSession                                                                                                                           ����         $�             K.        close                                                                                                                                                                                                                              �Initialize                                                                           �Initialize With Options                                                             �Configuration Functions                                                             �RF                                                                                   �Configure RF                                                                         �Configure ALC Enabled                                                                �Configure Output Enabled                                                            CAnalog Modulation                                                                    �Configure AM Enabled [AM]                                                            �Configure AM External Coupling [AM]                                                  �Configure AM [AM]                                                                    �Configure FM Enabled [FM]                                                            �Configure FM External Coupling [FM]                                                  �Configure FM [FM]                                                                    �Configure PM Enabled [PM]                                                            �Configure PM External Coupling [PM]                                                  �Configure PM [PM]                                                                    �Get Analog Modulation Source Name [MS]                                              oPulse Modulation                                                                     �Configure Pulse Modulation Enabled [PULM]                                            �Configure Pulse Modulation Source [PULM]                                             �Configure Pulse Modulation External Polarity [PULM]                                 lLF Generator                                                                         �Configure LF Generator [LF]                                                          �Get LF Generator Name [LF]                                                           �Set Active LF Generator [LF]                                                         �Configure LF Generator Output [LFO]                                                 �Pulse Generator                                                                      �Configure Pulse External Trigger [PG]                                                �Configure Pulse Internal Trigger [PG]                                                �Configure Pulse [PG]                                                                 �Configure Pulse Double [DPG]                                                         �Configure Pulse Output [PGO]                                                        9Sweep                                                                                �Configure Sweep                                                                      �Configure Frequency Sweep Start Stop [FSW]                                           �Configure Frequency Sweep Center Span [FSW]                                          �Configure Frequency Sweep Time [FSW]                                                 �Configure Power Sweep Start Stop [PSW]                                               �Configure Power Sweep Time [PSW]                                                     �Configure Frequency Step Start Stop [FST]                                            �Configure Frequency Step Dwell [FST]                                                 �Reset Frequency Step [FST]                                                           �Configure Power Step Start Stop [PST]                                                �Configure Power Step Dwell [PST]                                                     �Reset Power Step [PST]                                                              KList                                                                                 �Create Frequency List [LST]                                                          �Create Power List [LST]                                                              �Create Frequency Power List [LST]                                                    �Select List [LST]                                                                    �Clear All Lists [LST]                                                                �Configure List Dwell [LST]                                                           �Reset List [LST]                                                                    
�ALC                                                                                  �Configure ALC [ALC]                                                                 
�Reference Oscillator                                                                 �Configure Reference Oscillator [RO]                                                 OIQ                                                                                   �Configure IQ Enabled [MIQ]                                                           �Configure IQ [MIQ]                                                                   �Calibrate IQ [MIQ]                                                                   �Configure IQ Impairment Enabled [IQI]                                                �Configure IQ Impairment [IQI]                                                       lARB Generator                                                                        �Configure Arb [ARB]                                                                  �Write Arb Waveform [ARB]                                                             �Select Arb Waveform [ARB]                                                            �Clear All Arb Waveforms [ARB]                                                        �Query Arb Waveform Capabilities [ARB]                                                �Configure Arb Trigger Source [ARB]                                                   �Configure Arb External Trigger Slope [ARB]                                          �Digital Modulation Base                                                              �Get Digital Modulation Base Standard Name [DMB]                                      �Select DigitalModulationBase Standard [DMB]                                          �Configure DigitalModulationBase Clock Source [DMB]                                   �Configure DigitalModulationBase Data Source [DMB]                                    �Configure DigitalModulationBase PRBS Type [DMB]                                      �Write DigitalModulationBase Bit Sequence [DMB]                                       �Select DigitalModulationBase Bit Sequence [DMB]                                      �Clear All DigitalModulationBase Bit Sequences [DMB]                                 kCDMA                                                                                 �Get CDMA Standard Name [CDMA]                                                        �Select CDMA Standard [CDMA]                                                          �Configure CDMA Clock Source [CDMA]                                                   �Configure CDMA Trigger Source [CDMA]                                                 �Configure CDMA External Trigger Slope [CDMA]                                         �Get CDMA Test Model Name [CDMA]                                                      �Select CDMA Test Model [CDMA]                                                       �TDMA                                                                                 �Get TDMA Standard Name [TDMA]                                                        �Select TDMA Standard [TDMA]                                                          �Configure TDMA Clock Source [TDMA]                                                   �Configure TDMA Trigger Source [TDMA]                                                 �Configure TDMA External Trigger Slope [TDMA]                                         �Get TDMA Frame Name [TDMA]                                                           �Select TDMA Frame [TDMA]                                                            �Set/Get/Check Attribute                                                             �Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             fGet Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             �Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           �Action Functions                                                                     �Disable All Modulation                                                               �Wait Until Settled                                                                   �Is Settled                                                                           �Send Software Trigger [SWT]                                                         �Utility Functions                                                                    �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Self-Test                                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Invalidate All Attributes                                                            �Get Specific Driver C Handle                                                         �Get Next Coercion Record                                                            fError Info                                                                           �Get Error                                                                            �Clear Error                                                                         �Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           