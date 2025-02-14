s��   	     0�   a �~  50   �   ����                                IviACPwr                        IviACPwr Class Driver (NI)                  _VI_FUNC                                                  � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr   �    This instrument driver contains functions for the IviACPwr class, which provides programming support for AC power sources.  This driver has all the functions that IVI and VXIplug&play require.  

Note:  This driver requires the VISA and IVI libraries.       �    This class contains functions that configure AC power sources. The class includes high-level functions that configure multiple instrument settings as well as low-level functions that set, get, and check individual attribute values.
     �    This class contains functions defined by the IviACPwrPhase extension group. The IviACPwrPhase extension group defines extensions for AC power sources that support multiple phase operation.     �    This class contains functions defined by the IviACPwrArbWaveform extension group. The IviACPwrArbWaveform extension group defines extensions for producing user-defined arbitrary waveforms.     �    This class contains functions defined by the IviACPwrImpedance extension group. The IviACPwrImpedance extension group defines extensions for AC power sources with the ability to configure the output impedance.     �    This class contains functions defined by the IviACPwrVoltageProtection extension group. The IviACPwrVoltageProtection extension group defines extensions for AC power sources that allow programmable voltage protection.     �    This class contains functions defined by the IviACPwrCurrentProtection extension group. The IviACPwrCurrentProtection extension group defines extensions for AC power sources that allow programmable current protection.     �    This class contains functions defined by the IviACPwrDCGeneration extension group. The IviACPwrDCGeneration extension group defines extensions for AC power sources capable of producing a DC output.        This class contains functions defined by the IviACPwrExternalSync extension group. The IviACPwrExternalSync extension group defines extensions for AC power sources with the ability to use an external signal to synchronize the power source output frequency.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that verify the validity of a value that you specify for an attribute. There are typesafe functions for each attribute data type.     r    This class contains functions and sub-classes that initiate AC power source operations and report their status.
    #    This class contains functions defined by the IviACPwrVoltageRamp extension group. The IviACPwrVoltageRamp extension group defines extensions for AC power wources with the capability to configure a linear voltage ramp with a starting and ending voltage in volts RMS and duration in seconds.        This class contains functions defined by the IviACPwrCurrentRamp extension group. The IviACPwrCurrentRamp extension group defines extensions for AC power sources with the capability to configure a linear current ramp with a starting and ending current in amps and duration in seconds.         This class contains functions defined by the IviACPwrFrequencyRamp extension group. The IviACPwrFrequencyRamp extension group defines extensions for AC power sources with the capability to configure a linear frequency ramp starting and ending frequency in hertz and duration in seconds.     d    This class contains functions and sub-classes that transfer data to and from the AC power source.
    d    This class contains functions and sub-classes that control common instrument operations.  These functions include many of the functions that VXIplug&play requires, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     N    This class contains functions that retrieve and clear IVI error information.     ?    This class contains functions that retrieve coercion records.     J    This class contains functions that retrieve interchangeability warnings.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    J    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Logical Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset Device parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:
This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviACPwr_LockSession and IviACPwr_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use. The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session. You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleACPwr"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive. If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (default value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (default value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use the IviACPwr_LockSession and IviACPwr_UnlockSession functions to protect sections of code that require exclusive access to the resource.

    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    � =   �  �    Logical Name                      { : �       ID Query                          � =� �       Reset Device                       < �C �  �    Instrument Handle                 "�#����  �    Status                             "SampleACPwr"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          V    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    IVIACPWR_ATTR_RANGE_CHECK         
    IVIACPWR_ATTR_QUERY_INSTRUMENT_STATUS  
    IVIACPWR_ATTR_CACHE               
    IVIACPWR_ATTR_SIMULATE            
    IVIACPWR_ATTR_RECORD_COERCIONS    

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset Device parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:
This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviACPwr_LockSession and IviACPwr_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use. The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session. You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleACPwr"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive. If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use the IviACPwr_LockSession and IviACPwr_UnlockSession functions to protect sections of code that require exclusive access to the resource.

    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    r    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVIACPWR_ATTR_RANGE_CHECK
QueryInstrStatus  IVIACPWR_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIACPWR_ATTR_CACHE   
Simulate          IVIACPWR_ATTR_SIMULATE  
RecordCoercions   IVIACPWR_ATTR_RECORD_COERCIONS

The format of this string is "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

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
    4? =   �  �    Logical Name                      8
 : �       ID Query                          : =� �       Reset Device                      :� �Y �  �    Instrument Handle                 =�#����  �    Status                            F �  � �    Option String                      "SampleACPwr"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    [    This function configures the line-to-neutral output voltage level of the AC power source.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    K    Specifies the name of the output on which to configure the voltage level.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Specifies the voltage level on the selected phase. The driver uses this value to set the IVIACPWR_ATTR_VOLTAGE_LEVEL attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    N�-   �  �    Instrument Handle                 Os -  �  �    Phase Name                        S� -� �  �    Voltage Level                     Td#����  �    Status                                 ""        	               This function configures the current limit. IviACPwr_ConfigureCurrentLimit specifies the output current limit value and the behavior of the power source when the output current reaches the limit value for constant current mode or exceeds the limit value for constant voltage mode.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    K    Specifies the name of the output on which to configure the current limit.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Sets the output current limit. The driver uses this value to set the IVIACPWR_ATTR_CURRENT_LIMIT attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    ^�-   �  �    Instrument Handle                 _� -  �  �    Phase Name                        c� -� �  �    Limit                             d�#����  �    Status                                 ""        	           >    This function opens or closes the power source output relay.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Opens or closes the power source output relay. The driver uses this value to set the IVIACPWR_ATTR_OUTPUT_ENABLED attribute.

Valid Values:
VI_TRUE  - Enables the output.
VI_FALSE - Disables the output.

Default Value:
False    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    D    Specifies the name of the output on which to configure the output.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    n4-   �  �    Instrument Handle                 n� - �  �    Output Enabled                    o�#����  �    Status                            xR -  �  �    Phase Name                             True VI_TRUE False VI_FALSE    	           ""    f    This function configures the waveform used to generate output voltage on the specified output phase.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    F    Specifies the name of the output on which to configure the waveform.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Specifies the name of the waveform used to generate output voltage on the specified phase. The driver uses this value to set the IVIACPWR_ATTR_WAVEFORM attribute.

Default Value: ""    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    ~-   �  �    Instrument Handle                 ~� -  �  �    Phase Name                        � -� �  �    Waveform Name                     ��#����  �    Status                                 ""    ""    	           D    This function configures the voltage range of the AC power source.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    K    Specifies the name of the output on which to configure the voltage range.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Specifies the voltage range of the AC power source. The driver uses this value to set the IVIACPWR_ATTR_VOLTAGE_RANGE attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    ��-   �  �    Instrument Handle                 �K -  �  �    Phase Name                        �� -� �  �    Range                             �=#����  �    Status                                 ""        	           v    This function returns the minimum and maximum RMS voltage allowed for the user-specified voltage range and waveform.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    H    Specifies the name of the output for which to query the voltage range.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Specifies the name of the waveform to query for the range. If the waveform name parameter is VI_NULL, this function returns the range for a sine waveform.

Default Value: ""     P    Returns the minimum RMS voltage supported by the specified range and waveform.     P    Returns the maximum RMS voltage supported by the specified range and waveform.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     ;    Specifies the output range to query.

Default Value: None    �$-   �  �    Instrument Handle                 �� -  �  �    Phase Name                        �- -� �  �    Waveform Name                     �� �  �  �    Min Voltage                       �< � � �  �    Max Voltage                       ��#����  �    Status                            � - � �  �    Range                                  ""    ""    	            	            	               �    This function returns the specific driver-defined output phase name that corresponds to the one-based index that you specify. If the driver defines a qualified output phase name, this function returns the qualified name. If the value that you pass for the Index parameter is less than one or greater than the value of the IVIACPWR_ATTR_OUTPUT_PHASE_COUNT attribute, the function returns an empty string in the Name parameter and returns the Invalid Value error.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies a one-based index that defines which name to return.

Valid Range:
1 to the value returned by the IVIACPWR_ATTR_OUTPUT_PHASE_COUNT attribute.

Default Value:
1     Y    Specifies the number of bytes in the ViChar array that you pass for the Name parameter.     �    Specifies the buffer into which the function returns the name that corresponds to the index you specify.

You can pass VI_NULL for this parameter if the Name Buffer Size parameter is 0.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    ��-   �  �    Instrument Handle                 �� -  �  �    Index                             �@ - � �  �    Name Buffer Size                  �� -� �  �    Name                              �d#����  �    Status                                 1        	            	            t    This function configures the frequency of a single phase power source or all phases of a multi-phase power source.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies the output frequency of the power source. The driver uses this value to set the IVIACPWR_ATTR_FREQUENCY attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    ��-   �  �    Instrument Handle                 �B - � �  �    Frequency                         ��#����  �    Status                                     	           7    This function configures the output frequency range.      �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies the frequency range of the power source. The driver uses this value to set the IVIACPWR_ATTR_FREQUENCY_RANGE attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    �J-   �  �    Instrument Handle                 � - � �  �    Frequency Range                   ȣ#����  �    Status                                     	           �    This function returns the minimum and maximum frequency, in hertz, allowed for the user-specified frequency range. The value   assigned to the IVIACPWR_ATTR_FREQUENCY attribute must not be outside these minimum and maximum values.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     A    Returns the minimum frequency supported by the specified range.     A    Returns the maximum frequency supported by the specified range.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Specifies the frequency range to query. This parameter must be between 1 and the value reported by the IVIACPWR_ATTR_NUM_FREQUENCY_RANGES attribute.

Default Value: None    ��-   �  �    Instrument Handle                 �z - � �  �    Min Frequency                     �� -� �  �    Max Frequency                     �#����  �    Status                            ܇ -  �  �    Range                                  	            	            	                �    This function configures the phase angle. IviACPwr_ConfigurePhaseAngle specifies the phase angle of each phase of the source as it relates to the Phase A.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    P    Specifies the name of the output phase for which to configure the phase angle.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Sets the specified output phase angle. The driver uses this value to set the IVIACPWR_ATTR_PHASE_ANGLE attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    �-   �  �    Instrument Handle                 �� -  �  �    Phase Name                        �$ -� �  �    Phase Angle                       �#����  �    Status                                 ""        	          e    This function deletes individual user-defined waveforms from the memory of the power source.

If the waveform cannot be cleared because it is currently being used to generate output voltage, this function returns the Waveform In Use error. If the waveform name is Sine or a fixed vendor-defined waveform, this function returns the Waveform Reserved error.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies the name of the user-defined waveform to remove from the power source memory. If the Waveform Name parameter is VI_NULL, IviACPwr_ClearArbWaveform clears all user-defined waveforms.

Default Value:
""    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    �-   �  �    Instrument Handle                 �C - � �  �    Waveform Name                     �#����  �    Status                                 ""    	           -    This function returns a comma delimited string of user-defined and/or fixed vendor-defined waveform names currently stored in the AC power source.

To determine the number of additional user-defined waveforms that the power source can store, use the IVIACPWR_ATTR_AVAILABLE_WAVEFORM_COUNT attribute.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Specifies whether the returned catalog string contains fixed vendor-defined and/or user-defined waveform names.

Valid Values:
Fixed - IVIACPWR_VAL_WAVEFORM_CATALOG_FIXED
Request catalog of fixed vendor defined waveform names.

User - IVIACPWR_VAL_WAVEFORM_CATALOG_USER
Request catalog of user-defined waveform names.

All - IVIACPWR_VAL_WAVEFORM_CATALOG_ALL
Request catalog of all waveform names.

Default Value:
Fixed     =    The size of the user-allocated buffer.

Default Value: None     v    A user-allocated buffer to store a comma delimited string of waveform names currently stored in the AC power source.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    ��-   �  �    Instrument Handle                 �= -  � �    Catalog Type                      �� - � �  �    Catalog Buffer Size               �/ -� �  �    Catalog                           ��#����  �    Status                                            xFixed IVIACPWR_VAL_WAVEFORM_CATALOG_FIXED User IVIACPWR_VAL_WAVEFORM_CATALOG_USER All IVIACPWR_VAL_WAVEFORM_CATALOG_ALL        	            	           �    This function writes an individual user-defined waveform to the memory of the AC power source. If the power source cannot store any more arbitrary waveforms, this function returns the No Waveforms Available error.

If the waveform name already exists, then the function returns the Duplicate Waveform Name error.

If the absolute value of the sum of all waveform data points exceeds 0.001% of the peak to peak amplitude, the function returns the Waveform DC Offset error.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     x    Specifies the waveform name that identifies the arbitrary waveform to write to the AC power source.

Default Value:
""     U    Specifies the size of the user-allocated waveform data buffer.

Default Value: None     |    Specifies the user-allocated array of the user-defined waveform data to store in the AC power source.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   
�-   �  �    Instrument Handle                r -  �  �    Waveform                         � - � �  �    Waveform Data Buffer Size        O -� �  �    Waveform Data                    �#����  �    Status                                 ""            	            �    This function configures the output impedance of the AC power source. You must set the Output Impedance Enabled parameter to True in order for the Resistive Value or Inductive Value to affect the power source output.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    6    Specifies the name of the output phase to configure.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    �    Enables/disables the output impedance capability of the AC power source. The driver uses this value to set IVIACPWR_ATTR_OUTPUT_IMPEDANCE_ENABLED attribute.

Valid Values:
VI_TRUE  - Allows the output impedance resistive and output impedance inductive settings to affect the power source output.
VI_FALSE - Disallows the output impedance resistive and output impedance inductive settings to affect the power source output.

Default Value:
True     �    Sets the resistive part of the output impedance of the AC power source in ohms. The driver uses this value to set IVIACPWR_ATTR_OUTPUT_IMPEDANCE_RESISTIVE attribute.

Default Value: None     �    Sets the inductive part of the output impedance of the AC power source in henries. The driver uses this value to set IVIACPWR_ATTR_OUTPUT_IMPEDANCE_INDUCTIVE attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   W-   �  �    Instrument Handle                 -  �  �    Phase Name                       N - �  �    Output Impedance Enabled          -� �  �    Resistive Value                  � �� �  �    Inductive Value                  �#����  �    Status                                 ""   True VI_TRUE False VI_FALSE            	            t    This function queries the output impedance capabilities of the AC power source based on the present configuration.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    2    Specifies the name of the output phase to query.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     Z    Returns the minimum resistive impedance value that you can specify for the power source.     Z    Returns the maximum resistive impedance value that you can specify for the power source.     Z    Returns the minimum inductive impedance value that you can specify for the power source.     Z    Returns the maximum inductive impedance value that you can specify for the power source.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   *-   �  �    Instrument Handle                *� -  �  �    Phase Name                       / - � �  �    Resistive Min                    /e -� �  �    Resistive Max                    /� � � �  �    Inductive Min                    0) �� �  �    Inductive Max                    0�#����  �    Status                                 ""    	            	            	            	            	           �    This function configures voltage protection. When the corresponding enabled parameter is True, the AC power source enters the voltage protection state (tripped) and disables the output when the output voltage is below the Under Voltage Limit or above the Over Voltage Limit.

When the Over Volt Protection Enabled and/or Under Volt Protection Enabled parameter is False, the corresponding limit does not affect the behavior of the instrument. In addition, under and/or over voltage protection is disabled.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    6    Specifies the name of the output phase to configure.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.        Enables or disables under voltage protection. The driver uses this value to set the IVIACPWR_ATTR_UNDER_VOLTAGE_PROTECTION_ENABLED attribute.

Valid Values:
VI_TRUE  - Enables under voltage protection.
VI_FALSE - Disables under voltage protection.

Default Value:
True     �    Specifies the under voltage protection level. The driver uses this value to set the IVIACPWR_ATTR_UNDER_VOLTAGE_PROTECTION_LIMIT attribute.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    Specifies the over voltage protection level. The driver uses this value to set the IVIACPWR_ATTR_OVER_VOLTAGE_PROTECTION_LIMIT attribute.

Default Value: None    
    Enables or disables over voltage protection. The driver uses this value to set the IVIACPWR_ATTR_OVER_VOLTAGE_PROTECTION_ENABLED attribute.

Valid Values:
VI_TRUE  - Enables over voltage protection.
VI_FALSE - Disables over voltage protection.

Default Value:
True   <�-   �  �    Instrument Handle                ={ -  �  �    Phase Name                       A� - �  �    Under Volt Protection Enabled    B� -� �  �    Under Voltage Limit              Cy#����  �    Status                           K� ~� �  �    Over Voltage Limit               L� y �  �    Over Volt Protection Enabled           ""   True VI_TRUE False VI_FALSE        	               True VI_TRUE False VI_FALSE   �    This function returns the voltage protection state of the AC power source.

Voltage protection trips when the output voltage is above the IVIACPWR_ATTR_OVER_VOLTAGE_PROTECTION_LIMIT attribute or below the IVIACPWR_ATTR_UNDER_VOLTAGE_PROTECTION_LIMIT attributes and the corresponding IVIACPWR_ATTR_VOLTAGE_PROTECTION_ENABLED attribute is set to True.

When voltage protection trips, the power source enters the voltage protection state and disables the output. You must call the IviACPwr_ResetVoltageProtection function to reset the voltage protection state of the AC power source. Once voltage protection is reset, you must then set IVIACPWR_ATTR_OUTPUT_ENABLED attribute to True for the AC power source to resume generating output voltage.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    2    Specifies the name of the output phase to query.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     1    Returns True if voltage protection has tripped.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   Rk-   �  �    Instrument Handle                S$ -  �  �    Phase Name                       W^ -� �  �    Tripped                          W�#����  �    Status                                 ""    	            	           G    This function resets the AC power source voltage protection state after a voltage protection condition has occurred. You also must set the IVIACPWR_ATTR_OUTPUT_ENABLED attribute to True to resume generating output power.

Use the IviACPwr_QueryVoltageProtectionTripped function to determine if voltage protection has tripped.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   bW-   �  �    Instrument Handle                c - � �  �    Phase Name                       gA#����  �    Status                                 ""    	           �    This function configures current protection. When the Current Protection Enabled parameter is True, the power source enters the current protection state (tripped) and disables the output when the output current exceeds the current threshold for the current delay time.

When the Current Protection Enabled parameter is False, the threshold and delay do not affect the behavior of the instrument behavior and current protection is disabled.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    6    Specifies the name of the output phase to configure.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Enables/disables current protection. The driver uses this value to set IVIACPWR_ATTR_CURRENT_PROTECTION_ENABLED attribute.

Valid Values:
VI_TRUE  - Enables current protection.
VI_FALSE - Disables current protection.

Default Value:
True     �    Specifies the current threshold that triggers over current protection. The driver uses this value to set IVIACPWR_ATTR_CURRENT_PROTECTION_THRESHOLD attribute.

Default Value: None     �    Specifies the time the output current must exceed the over current protection threshold until over current protection is triggered. The driver uses this value to set IVIACPWR_ATTR_CURRENT_PROTECTION_DELAY attribute.

Unit: seconds

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   r2-   �  �    Instrument Handle                r� -  �  �    Phase Name                       w) - �  �    Current Protection Enabled       x  -� �  �    Threshold                        x� �  �  �    Delay                            y�#����  �    Status                                 ""   True VI_TRUE False VI_FALSE            	           �    This function returns the current protection state of the AC power source.

Current protection trips when the output current exceeds the value of the IVIACPWR_ATTR_CURRENT_PROTECTION_THRESHOLD attribute for the time specified by the IVIACPWR_ATTR_CURRENT_PROTECTION_DELAY attribute and the IVIACPWR_ATTR_CURRENT_PROTECTION_ENABLED attribute is set to True.

When current protection trips, the power source enters the current protection state and disables the output. You must call the IviACPwr_ResetCurrentProtection function to reset the current protection state of the AC power source. Once current protection is reset, you must then set the IVIACPWR_ATTR_OUTPUT_ENABLED attribute to True for the AC power source to resume generating output current.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    2    Specifies the name of the output phase to query.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     1    Returns True if current protection has tripped.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ��-   �  �    Instrument Handle                �� -  �  �    Phase Name                       �� -� �  �    Tripped                          ��#����  �    Status                                 ""    	            	           G    This function resets the AC power source current protection state after a current protection condition has occurred. You also must set the IVIACPWR_ATTR_OUTPUT_ENABLED attribute to True to resume generating output power.

Use the IviACPwr_QueryCurrentProtectionTripped function to determine if current protection has tripped.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ��-   �  �    Instrument Handle                �v - � �  �    Phase Name                       ��#����  �    Status                                 ""    	            4    This function configures the DC output generation.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    6    Specifies the name of the output phase to configure.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    3    Configures the output generation as AC only, DC only, or both AC and DC output. The driver uses this value to set the IVIACPWR_ATTR_DC_MODE attribute.

The mode you select determines when the IVIACPWR_ATTR_VOLTAGE_LEVEL and the IVIACPWR_ATTR_DC_VOLTAGE_LEVEL attributes are used:
- If you specify AC Only mode, the IVIACPWR_ATTR_VOLTAGE_LEVEL attribute sets the RMS value of the AC voltage.
- If you specify DC Only mode, the IVIACPWR_ATTR_DC_VOLTAGE_LEVEL attribute sets the DC voltage.
- If you specify AC DC mode, the IVIACPWR_ATTR_VOLTAGE_LEVEL attribute sets the RMS value of the AC voltage and the IVIACPWR_ATTR_DC_VOLTAGE_LEVEL attribute sets the DC offset voltage.

Valid Values:
AC Only - IVIACPWR_VAL_MODE_AC_ONLY
DC Only - IVIACPWR_VAL_MODE_DC_ONLY
AC DC   - IVIACPWR_VAL_MODE_AC_DC

Default Value: AC Only     �    Specifies the power source DC output voltage if you specify DC Only mode or the DC offset voltage if you specify AC DC mode. The driver uses this value to set the IVIACPWR_ATTR_DC_VOLTAGE_LEVEL attribute.

Default Value: None   �)   �  �    Instrument Handle                ��"����  �    Status                           �G 4  �  �    Phase Name                       �� 4 � � �    Mode                             �� 4� �  �    DC Voltage Level                       	           ""               bAC Only IVIACPWR_VAL_MODE_AC_ONLY DC Only IVIACPWR_VAL_MODE_DC_ONLY AC DC IVIACPWR_VAL_MODE_AC_DC       >    This function configures the DC voltage range of the AC power source. The driver sets the power source to the lowest range that supports the minimum and maximum voltages specified by the Minimum and Maximum parameters. The driver then updates the IVIACPWR_ATTR_DC_RANGE_MIN and IVIACPWR_ATTR_DC_RANGE_MAX attributes.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    6    Specifies the name of the output phase to configure.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Specifies the minimum DC voltage. The driver coerces this value to the minimum voltage of the lowest range that supports this value.

Default Value: None     �    Specifies the maximum DC voltage. The driver coerces this value to the maximum voltage of the lowest range that supports this value.

Default Value: None   ��)   �  �    Instrument Handle                �>"����  �    Status                           ¹ 6  �  �    Phase Name                       �� 6 � �  �    Minimum                          ǚ 6� �  �    Maximum                                	           ""           ]    This function returns the minimum and maximum DC voltages the power source can generate for the specified range. Typically, you call the IviACPwr_ConfigureDCRange function and pass the minimum and maximum voltages you want to use, and the driver automatically selects the best range. However, the IviACPwr_QueryDCCapabilities function is useful if you want to eliminate unnecessary range changes by allowing you to know the range boundaries in advance.

The IVIACPWR_ATTR_DC_RANGE_MIN and IVIACPWR_ATTR_DC_RANGE_MAX attributes return the minimum and maximum voltage, respectively, of the present range.
     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    2    Specifies the name of the output phase to query.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     �    Specifies the DC range to query. This number must be from 1 to the values returned by the IVIACPWR_ATTR_DC_NUM_RANGES attribute.

Default Value: None     ?    Returns the minimum DC voltage the power source can generate.     ?    Returns the maximum DC voltage the power source can generate.   ��*   �  �    Instrument Handle                ̂#����  �    Status                           �� >  �  �    Phase Name                       �7 > � �  �    Range                            �� >� �  �    Minimum                          � �� �  �    Maximum                                	           ""        	           	           �    This function specifies whether to enable or disable external synchronization and sets the phase offset relative to the external synchronization signal.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    K    Specifies whether the power source should synchronize its frequency to an external signal. The driver uses this value to set the IVIACPWR_ATTR_EXTERNAL_SYNC_ENABLED attribute.

Valid Values:
VI_TRUE  - Enables synchronization to an external signal.
VI_FALSE - Disables synchronization to an external signal.

Default Value:
False     �    Sets the phase angle offset (degrees) of the specified output phase relative to the external synchronization signal. The driver uses this value to set the IVIACPWR_ATTR_EXTERNAL_SYNC_PHASE_OFFSET attribute.

Default Value: None   �v,   �  �    Instrument Handle                �/#����  �    Status                           � 4 P �       Synchronization Enabled          �� 4� �  �    Offset                                 	           True VI_TRUE False VI_FALSE        b    This function returns whether the power source is locked to the external synchronization signal.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     ]    Returns whether the power source output is locked with the external synchronization signal.   �[,   �  �    Instrument Handle                �#����  �    Status                           � @ � �  �    Locked                                 	           	           �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    D    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose values cannot be set are dim.  Help text is shown for 
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
     �    If the attribute is phase-based, this parameter specifies the name of the phase on which to set the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
   �-   �  �    Instrument Handle                �9#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     	' =  �  �    Phase Name                             	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors        Pass the value to which you want to set the attribute.

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
     �    If the attribute is phase-based, this parameter specifies the name of the phase on which to set the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""   x-   �  �    Instrument Handle                2#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     ! =  �  �    Phase Name                             	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors        Pass the value to which you want to set the attribute.

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
     �    If the attribute is phase-based, this parameter specifies the name of the phase on which to set the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""   (l-   �  �    Instrument Handle                )&#����  �    Status                           1� � � �  �    Attribute Value                 ���� � ���                                          3� = � � �    Attribute ID                     9 =  �  �    Phase Name                             	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

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
     �    If the attribute is phase-based, this parameter specifies the name of the phase on which to set the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
   @`-   �  �    Instrument Handle                A#����  �    Status                           I� � � �  �    Attribute Value                 ���� � ���                                          K� = � � �    Attribute ID                     Q =  �  �    Phase Name                             	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is phase-based, this parameter specifies the name of the phase on which to set the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    C    Pass the ID of an attribute.

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
   XY-   �  �    Instrument Handle                Y#����  �    Status                           a� � � �  �    Attribute Value                  c� =  �  �    Phase Name                       d� = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to query the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

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
   m=-   �  �    Instrument Handle                m�#����  �    Status                           v| � � �  �    Attribute Value                  x: =  �  �    Phase Name                       y! = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    ~    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
         
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to query the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    �    Pass the ID of an attribute.

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
   ��-   �  �    Instrument Handle                �v#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Phase Name                       �� = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the   number of bytes in the value, pass a negative number for the Buffer Size parameter.

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviACPwr_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    
;    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    &    The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to query the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value: 512    �    Pass the ID of an attribute.

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
   �L-   �  �    Instrument Handle                �#����  �    Status or Required Size          �I � L � �    Attribute Value                  �w =  �  �    Phase Name                       �^ =� �  �    Buffer Size                      �T = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to query the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    �    Pass the ID of an attribute.

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
   �--   �  �    Instrument Handle                ��#����  �    Status                           �n � � �  �    Attribute Value                  �. =  �  �    Phase Name                       � = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to query the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    �    Pass the ID of an attribute.

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
   ǵ-   �  �    Instrument Handle                �o#����  �    Status                           �� � � �  �    Attribute Value                  Ҷ =  �  �    Phase Name                       Ӟ = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    '    Pass the value that you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to verify the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

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
   ��-   �  �    Instrument Handle                ړ#����  �    Status                           � � � �  �    Attribute Value                  �G =  �  �    Phase Name                      ���� � ���                                          �/ = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    '    Pass the value that you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to verify the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    B    Pass the ID of an attribute.

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
   �n-   �  �    Instrument Handle                �(#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Phase Name                      ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors

    '    Pass the value that you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to verify the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    B    Pass the ID of an attribute.

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
   -   �  �    Instrument Handle                �#����  �    Status                           
G � � �  �    Attribute Value                  v =  �  �    Phase Name                      ���� � ���                                          _ = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    '    Pass the value that you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to verify the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    D    Pass the ID of an attribute.

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
   �-   �  �    Instrument Handle                [#����  �    Status                           � � � �  �    Attribute Value                    =  �  �    Phase Name                      ���� � ���                                           � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    }    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors    '    Pass the value that you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none     �    If the attribute is phase-based, this parameter specifies the name of the phase for which to verify the value of the attribute. If the attribute is not phase-based, then pass VI_NULL or an empty string.

Default Value:  ""
    D    Pass the ID of an attribute.

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
   (<-   �  �    Instrument Handle                (�#����  �    Status                           1{ � � �  �    Attribute Value                  3� =  �  �    Phase Name                      ���� � ���                                          4� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0       This function starts a linear voltage ramp from a starting voltage to an ending voltage in volts RMS for a duration in seconds. Call the IviACPwr_QueryVoltageRampBusy function to determine when the ramp completes or call the IviACPwr_AbortVoltageRamp function to stop the voltage ramp.

The starting and ending ramp voltages must not exceed the values of the present voltage range.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     `    Specifies the starting output voltage for the power source, in volts RMS.

Default Value: None     ^    Specifies the ending output voltage for the power source, in volts RMS.

Default Value: None     N    Specifies the duration of the voltage ramp, in seconds.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   =-   �  �    Instrument Handle                =� -  �  �    Phase Name                       A� - � �  �    Start Voltage                    BS -� �  �    End Voltage                      B� �  �  �    Duration                         C#����  �    Status                                 ""                	            i    This function aborts a voltage ramp. If a voltage ramp is not in progress, this function has no effect.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   M[-   �  �    Instrument Handle                N - � �  �    Phase Name                       RE#����  �    Status                                 ""    	            �    This function returns whether a voltage ramp is in progress. Call this function after calling the IviACPwr_RampVoltage function to determine when the ramp completes.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     s    Returns True if a voltage ramp is in progress. Returns False when a voltage ramp completes or is not in progress.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   \$-   �  �    Instrument Handle                \� -  �  �    Phase Name                       a -� �  �    Busy                             a�#����  �    Status                                 ""    	            	               This function starts a linear current ramp from a starting and ending current in amps for a duration in seconds. Call the IviACPwr_QueryCurrentRampBusy function to determine when the ramp completes or call the IviACPwr_AbortCurrentRamp function to stop the current ramp.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     Z    Specifies the starting output current of the power source, in amps.

Default Value: None     X    Specifies the ending output current of the power source, in amps.

Default Value: None     N    Specifies the duration of the current ramp, in seconds.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   l-   �  �    Instrument Handle                l� -  �  �    Phase Name                       p� - � �  �    Start Current                    q^ -� �  �    End Current                      q� �  �  �    Duration                         r#����  �    Status                                 ""                	            i    This function aborts a current ramp. If a current ramp is not in progress, this function has no effect.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   |`-   �  �    Instrument Handle                } - � �  �    Phase Name                       �J#����  �    Status                                 ""    	            �    This function returns whether a current ramp is in progress. Call this function after calling the IviACPwr_RampCurrent function to determine when the ramp completes.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    )    Specifies the name of the output phase.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.     s    Returns True if a current ramp is in progress. Returns False when a current ramp completes or is not in progress.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   �)-   �  �    Instrument Handle                �� -  �  �    Phase Name                       � -� �  �    Busy                             ��#����  �    Status                                 ""    	            	           �    This function starts a linear frequency ramp and then waits for it to complete. IviACPwr_RampFrequency specifies the starting and ending frequency in hertz and duration in seconds. Call the IviACPwr_QueryFrequencyRampBusy function to determine when the ramp completes or call the IviACPwr_AbortFrequencyRamp function to stop the frequency ramp.

The starting and ending ramp frequencies must not exceed the values of the present frequency range.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     ]    Specifies the starting output frequency of the power source, in hertz.

Default Value: None     [    Specifies the ending output frequency of the power source, in hertz.

Default Value: None     P    Specifies the duration of the frequency ramp, in seconds.

Default Value: None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ��-   �  �    Instrument Handle                � -  �  �    Start Frequency                  �� - � �  �    End Frequency                    �G -� �  �    Duration                         ��#����  �    Status                                             	            m    This function aborts a frequency ramp. If a frequency ramp is not in progress, this function has no effect.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ��-   �  �    Instrument Handle                �m#����  �    Status                                 	            �    This function returns whether a frequency ramp is in progress. Call this function after calling the IviACPwr_RampFrequency function to determine when the ramp completes.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     w    Returns True if a frequency ramp is in progress. Returns False when a frequency ramp completes or is not in progress.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   �-   �  �    Instrument Handle                �� - � �  �    Busy                             �M#����  �    Status                                 	            	            �    Initiates a measurement of one or more measurement groups for all output phases. To specify multiple groups, use the logical OR operator.        Specifies the group(s) to measure. Use the logical OR operator to specify multiple groups.

Valid Values:
IVIACPWR_VAL_MEASUREMENT_GROUP_BASE
Measure all items in the Base measurement group.

IVIACPWR_VAL_MEASUREMENT_GROUP_HARMONIC
Measure all items in the Harmonic measurement group.

IVIACPWR_VAL_MEASUREMENT_GROUP_DISTORTION
Measure all items in the Distortion measurement group.

IVIACPWR_VAL_MEASUREMENT_GROUP_WAVEFORM
Measure all items in the Waveform measurement group.

Default Value:
IVIACPWR_VAL_MEASUREMENT_GROUP_BASE     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   � @ � � �    Group                            �0+   �  �    Instrument Handle                ������  �    Status                                        �Base IVIACPWR_VAL_MEASUREMENT_GROUP_BASE Harmonic IVIACPWR_VAL_MEASUREMENT_GROUP_HARMONIC Distortion IVIACPWR_VAL_MEASUREMENT_GROUP_DISTORTION Waveform IVIACPWR_VAL_MEASUREMENT_GROUP_WAVEFORM        	           �    Returns the value measured by a previous call to the IviACPwr_InitiateMeasurement function. The IviACPwr_FetchMeasurement function returns a single measured value for the requested measurement type.

Call this function multiple times to retrieve the available measurement types and output phases. The available measurement types are divided into measurement groups. Use the IviACPwr_InitiateMeasurement function to measure fresh values for that group.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    M    Specifies the name of the output phase for which to return the measurement.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.        Specifies the type of measurement to return.

Valid Values:

Base Group:

Voltage RMS L-N - IVIACPWR_VAL_MEASURE_VOLTAGE_RMS_LN
Voltage RMS line to neutral is measured.

Current RMS - IVIACPWR_VAL_MEASURE_CURRENT_RMS
Current RMS is measured.

Frequency - IVIACPWR_VAL_MEASURE_FREQUENCY
Frequency is measured.

Voltage DC - IVIACPWR_VAL_MEASURE_VOLTAGE_DC
Voltage level is measured when in DC Only Mode.

Current DC - IVIACPWR_VAL_MEASURE_CURRENT_DC
Current level is measured when in DC Only Mode.

Power Factor - IVIACPWR_VAL_MEASURE_POWER_FACTOR
Power Factor is measured.

Crest Factor - IVIACPWR_VAL_MEASURE_CREST_FACTOR
Crest Factor is measured.

Current Peak - IVIACPWR_VAL_MEASURE_CURRENT_PEAK
Peak Current is measured.

Power VA - IVIACPWR_VAL_MEASURE_POWER_VA
Power is measured in Volts-Amps.

Real Power - IVIACPWR_VAL_MEASURE_POWER_REAL
Real Power is measured in Watts.

Power DC - IVIACPWR_VAL_MEASURE_POWER_DC
Power is measured in Watts when in DC Only Mode.

Phase Angle - IVIACPWR_VAL_MEASURE_PHASE_ANGLE
Phase Angle is measured in Degrees.

Voltage RMS L-L - IVIACPWR_VAL_MEASURE_VOLTAGE_RMS_LL
Voltage RMS (line-to-line) is measured.

Distortion Group:

Current OHD - IVIACPWR_VAL_MEASURE_CURRENT_OHD
Current Odd Harmonics Distortion is measured.

Current EHD - IVIACPWR_VAL_MEASURE_CURRENT_EHD
Current Even Harmonics Distortion is measured.

Current THD - IVIACPWR_VAL_MEASURE_CURRENT_THD
Current Total (Odd+Even) Harmonic Distortion is measured.

Voltage OHD - IVIACPWR_VAL_MEASURE_VOLTAGE_OHD
Voltage Odd Harmonics Distortion is measured.

Voltage EHD - IVIACPWR_VAL_MEASURE_VOLTAGE_EHD
Voltage Even Harmonics Distortion is measured.

Voltage THD - IVIACPWR_VAL_MEASURE_VOLTAGE_THD
Voltage Total (Odd+Even) Harmonic Distortion is measured.

Default Value:
Frequency - IVIACPWR_VAL_MEASURE_FREQUENCY         Returns the measured value.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ˯-   �  �    Instrument Handle                �h -  �  �    Phase Name                       н - � � �    Measurement Type                 �� -� �  �    Measurement                      �#����  �    Status                                 ""             UVoltage RMS L-N IVIACPWR_VAL_MEASURE_VOLTAGE_RMS_LN Current RMS IVIACPWR_VAL_MEASURE_CURRENT_RMS Frequency IVIACPWR_VAL_MEASURE_FREQUENCY Voltage DC IVIACPWR_VAL_MEASURE_VOLTAGE_DC Current DC IVIACPWR_VAL_MEASURE_CURRENT_DC Power Factor IVIACPWR_VAL_MEASURE_POWER_FACTOR Crest Factor IVIACPWR_VAL_MEASURE_CREST_FACTOR Current Peak IVIACPWR_VAL_MEASURE_CURRENT_PEAK Power VA IVIACPWR_VAL_MEASURE_POWER_VA Real Power IVIACPWR_VAL_MEASURE_POWER_REAL Power DC IVIACPWR_VAL_MEASURE_POWER_DC Phase Angle IVIACPWR_VAL_MEASURE_PHASE_ANGLE Voltage RMS L-L IVIACPWR_VAL_MEASURE_VOLTAGE_RMS_LL Current OHD IVIACPWR_VAL_MEASURE_CURRENT_OHD Current EHD IVIACPWR_VAL_MEASURE_CURRENT_EHD Current THD IVIACPWR_VAL_MEASURE_CURRENT_THD Voltage OHD IVIACPWR_VAL_MEASURE_VOLTAGE_OHD Voltage EHD IVIACPWR_VAL_MEASURE_VOLTAGE_EHD Voltage THD IVIACPWR_VAL_MEASURE_VOLTAGE_THD    	            	           �    Returns the values measured by a previous call to the IviACPwr_InitiateMeasurement function. The IviACPwr_FetchMeasurementArray function returns an array of measured values of the requested measurement type. 

Call this function multiple times to retrieve the available measurement types and output phases. The available measurement types are divided into measurement groups. Use the IviACPwr_InitiateMeasurement function to measure fresh values for that group.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    M    Specifies the name of the output phase for which to return the measurement.

Pass the virtual output phase name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual output phase name. The virtual output phase name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical output phase name.

Virtual output phase names are aliases for instrument-specific output phase strings, which can differ from one instrument to another. With virtual output phase names, you can use and swap instruments without having to change the output phase names in your source code. Assign a virtual output phase name to an instrument-specific output phase through the IVI Configuration utility. This parameter accepts virtual output phase names you have assigned to the specific instrument you are using and also accepts the instrument-specific output phase names.

Default Value: ""

Note: You can specify the output phase name as a string variable or as a literal enclosed in double quotes.    �    Specifies the type of measurement to return.

Valid Values:

Harmonic Group:

Array Current Harmonic Phase - IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_HARMONIC_PHASE
Current Harmonic Phase Angles are measured in degrees.

Array Current Harmonic Magnitude Absolute - IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_HARMONIC_ABS
Current Harmonic Magnitudes are measured as an absolute value in RMS Amps.

Array Current Harmonic Magnitude Percent Fundamental - IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_HARMONIC_PCT
Current Harmonic Magnitudes are measured as a Percent of fundamental.

Array Voltage Harmonic Phase - IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_HARMONIC_PHASE
Voltage Harmonic Phase Angles are measured in Degrees.

Array Voltage Harmonic Magnitude Absolute - IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_HARMONIC_ABS
Voltage Harmonic Magnitudes are measured as an absolute value in RMS Volts.

Array Voltage Harmonic Magnitude Percent Fundamental - IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_HARMONIC_PCT
Voltage Harmonic Magnitudes are measured as a percent of the fundamental.

Waveform Group:

Array Current Cycle - IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_CYCLE
Single cycle of the current waveform in Amps.

Array Voltage Cycle - IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_CYCLE
Single cycle of the Voltage Waveform in Volts.

Default Value:
Array Current Cycle - IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_CYCLE

Note:
Measurement types under Harmonic Group is applicable only when the option Harmonic Analysis and Synthesis is installed.     =    Specifies the size of the user-allocated measurement array.     "    Returns the measured data array.     ?    Returns the number of values stored in the measurement array.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ��-   �  �    Instrument Handle                � -  �  �    Phase Name                       �� - � �"    Measurement Type                 �� �  �  �    Measurement Buffer Size          � � � �  �    Measurement                      �7 �� �  �    Measurement Actual Size          �~#����  �    Status                                 ""              �Array Current Cycle IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_CYCLE Array Current Harmonic Phase IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_HARMONIC_PHASE Array Current Harmonic Magnitude Absolute IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_HARMONIC_ABS Array Current Harmonic Magnitude Percent Fundamental IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_HARMONIC_PCT Array Voltage Cycle IVIACPWR_VAL_MEASURE_ARRAY_VOLTAGE_CYCLE Array Voltage Harmonic Phase IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_HARMONIC_PHASE Array Voltage Harmonic Magnitude Absolute IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_HARMONIC_ABS Array Voltage Harmonic Magnitude Percent Fundamental IVIACPWR_VAL_MEASURE_ARRAY_CURRENT_HARMONIC_PCT        	            	            	           &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    q#����  �    Status                           �-   �  �    Instrument Handle                  	                   This function resets the instrument and applies initial user specified settings from the Logical Name that was used to initialize the session.  If the session was created without a Logical Name, this function is equivalent to the IviACPwr_reset function.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   (#����  �    Status                           �-   �  �    Instrument Handle                  	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   c#����  �    Status                           �-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

    &    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   t =  �  �    Self Test Result                  � = � � ,    Self-Test Message                !l#����  �    Status                           )�-   �  �    Instrument Handle                  	           	            	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   , = 3 �  �    Instrument Driver Revision       ,� =6 �  �    Firmware Revision                -!#����  �    Status                           5�-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   7� =  �  �    Error Code                       7� = � � ,    Error Message                    8�#����  �    Status                           A-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.      z    Pass the Status parameter that is returned from any of the instrument driver functions.

Default Value:  0  (VI_SUCCESS)     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
    H    Reports the status of this operation.  

This function can return only three possible status codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0085  Unknown status code (warning).

BFFF000A  Invalid parameter (Error Message buffer is VI_NULL).

        The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   C3 =  �  h    Error Code                       C� = � � �    Error Message                    DP#����  �    Status                           E�-   �  �    Instrument Handle                  0    	            	           VI_NULL    h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    l    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function. To obtain additional information about the error condition, call the IviACPwr_GetError function. To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     Z    Returns the C session instrument handle you use to call the specific driver's functions.   H.-   �  �    Instrument Handle                H�#����  �    Status                           Q[ = � �  �    Specific Driver C Handle               	           	           P    This function invalidates the cached values of all attributes for the session.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   R�#����  �    Status                           [K-   �  �    Instrument Handle                  	              �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviACPwr_GetError or IviACPwr_ClearError.
    
;    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   `Z#����  �    Status or Required Size          j�-   �  �    Instrument Handle                kW 3< �  �    BufferSize                       n7 3 P �  �    Code                             n� � Q � �    Description                        	                   	           	           e    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the instrument_handle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviACPwr_GetError function, which occurs when a call to IviACPwr_init or IviACPwr_InitWithOptions fails.    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   vh#����  �    Status                           ~�-   �  �    Instrument Handle                  	              �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the IVIACPWR_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    
<    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled. 
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   ��#����  �    Status or Required Size          �3-   �  �    Instrument Handle                �� � Q � �    Coercion Record                  �� = � �  �    Buffer Size                        	               	               /    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the IVIACPWR_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    
;    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

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

   �#����  �    Status or Required Size          �U-   �  �    Instrument Handle                � = � �  �    Buffer Size                      � � Q � �    Interchange Warning                	                   	            A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   �v-   �  �    Instrument Handle                �0#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviACPwr_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviACPwr_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviACPwr_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors   ��-   �  �    Instrument Handle                ��#����  �    Status                                 	          :    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviACPwr_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviACPwr_LockSession returns successfully, no other threads can access the instrument session until you call IviACPwr_UnlockSession.

Use IviACPwr_LockSession and IviACPwr_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviACPwr_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviACPwr_LockSession with a call to IviACPwr_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviACPwr_LockSession and IviACPwr_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviACPwr_LockSession.  This allows you to call IviACPwr_UnlockSession just once at the end of the function. 
    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviACPwr_LockSession or IviACPwr_UnlockSession in the same function.

The parameter is an input/output parameter.  IviACPwr_LockSession and IviACPwr_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviACPwr_LockSession does not lock the session again.  If the value is VI_FALSE, IviACPwr_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviACPwr_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviACPwr_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviACPwr_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviACPwr_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviACPwr_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviACPwr_LockSession(vi, &haveLock);
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
    IviACPwr_UnlockSession(vi, &haveLock);
    return error;
}   ��#����  �    Status                           �c-   �  �    Instrument Handle                � H � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviACPwr_LockSession.  Refer to IviACPwr_LockSession for additional information on session locks.
    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviACPwr_LockSession or IviACPwr_UnlockSession in the same function.

The parameter is an input/output parameter.  IviACPwr_LockSession and IviACPwr_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviACPwr_LockSession does not lock the session again.  If the value is VI_FALSE, IviACPwr_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviACPwr_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviACPwr_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviACPwr_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviACPwr_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviACPwr_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviACPwr_LockSession(vi, &haveLock);
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
    IviACPwr_UnlockSession(vi, &haveLock);
    return error;
}   �c#����  �    Status                           ��-   �  �    Instrument Handle                � H � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviACPwr_close.

(2) After calling IviACPwr_close, you cannot use the instrument driver again until you call IviACPwr_init or IviACPwr_InitWithOptions.

    s    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviACPwr_error_message function.  To obtain additional information about the error condition, call the IviACPwr_GetError function.  To clear the error information from the driver, call the IviACPwr_ClearError function.
          
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
BFFA2002    All phases required.
BFFA2003    Current protection tripped.
BFFA2004    Duplicate waveform name.
BFFA2005    Invalid waveform name.
BFFA2006    Measurement not initiated.
BFFA2007    Measurement not supported.
BFFA2008    No waveforms available.
BFFA200A    Phase values different.
BFFA200B    Unsupported measurement group.
BFFA200C    Voltage Protection tripped.
BFFA200E    Waveform in use.
BFFA200F    Waveform not found.
BFFA2010    Waveform reserved.
BFFA200D    Waveform DC Offset.
BFFA2001    All phases not supported.
BFFA2009    Output is enabled.

This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors     �    The ViSession handle that you obtain from the IviACPwr_init or IviACPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           �J-   �  �    Instrument Handle                  	            ����         ^  +y             K.        init                                                                                                                                    ����         ,�  L�             K.        InitWithOptions                                                                                                                         ����         NW  \�             K.        ConfigureVoltageLevel                                                                                                                   ����         ]�  m              K.        ConfigureCurrentLimit                                                                                                                   ����         m�  |�             K.        ConfigureOutputEnabled                                                                                                                  ����         }�  �V             K.        ConfigureWaveform                                                                                                                       ����         �F  ��             K.        ConfigureVoltageRange                                                                                                                   ����         ��  �R             K.        QueryVoltageRangeCapabilities                                                                                                           ����         ��  ��             K.        GetOutputPhaseName                                                                                                                      ����         �  �X             K.        ConfigureFrequency                                                                                                                      ����         �  �             K.        ConfigureFrequencyRange                                                                                                                 ����         ��  �:             K.        QueryFrequencyRangeCapabilities                                                                                                         ����         �o  �/             K.        ConfigurePhaseAngle                                                                                                                     ����         �  ��             K.        ClearArbWaveform                                                                                                                        ����         �O (             K.        QueryArbWaveformCatalog                                                                                                                 ����        � N             K.        WriteArbWaveform                                                                                                                        ����        u (             K.        ConfigureOutputImpedance                                                                                                                ����        )� 9             K.        QueryOutputImpedanceCapabilities                                                                                                        ����        :� M�             K.        ConfigureVoltageProtection                                                                                                              ����        O} `             K.        QueryVoltageProtectionTripped                                                                                                           ����        a o�             K.        ResetVoltageProtection                                                                                                                  ����        pq �]             K.        ConfigureCurrentProtection                                                                                                              ����        �� �x             K.        QueryCurrentProtectionTripped                                                                                                           ����        �n �"             K.        ResetCurrentProtection                                                                                                                  ����        �� ��             K.        ConfigureDC                                                                                                                             ����        �? �=             K.        ConfigureDCRange                                                                                                                        ����        �d �d             K.        QueryDCCapabilities                                                                                                                     ����        �� ��             K.        ConfigureExternalSync                                                                                                                   ����        �� ��             K.        QueryExternalSyncLocked                                                                                                                 ����        � 
             K.        SetAttributeViInt32                                                                                                                     ����        � "              K.        SetAttributeViReal64                                                                                                                    ����        #� 9�             K.        SetAttributeViString                                                                                                                    ����        ;� Q�             K.        SetAttributeViBoolean                                                                                                                   ����        S� i�             K.        SetAttributeViSession                                                                                                                   ����        k� }�             K.        GetAttributeViInt32                                                                                                                     ����        ~� �D             K.        GetAttributeViReal64                                                                                                                    ����        �� ��             K.        GetAttributeViString                                                                                                                    ����        �n Ĺ             K.        GetAttributeViBoolean                                                                                                                   ����        �� �A             K.        GetAttributeViSession                                                                                                                   ����        �~ �w             K.        CheckAttributeViInt32                                                                                                                   ����        � �             K.        CheckAttributeViReal64                                                                                                                  ����         � �             K.        CheckAttributeViString                                                                                                                  ����        D &D             K.        CheckAttributeViBoolean                                                                                                                 ����        '� 9�             K.        CheckAttributeViSession                                                                                                                 ����        ;z K�             K.        RampVoltage                                                                                                                             ����        L� Z�             K.        AbortVoltageRamp                                                                                                                        ����        [u j             K.        QueryVoltageRampBusy                                                                                                                    ����        j� z�             K.        RampCurrent                                                                                                                             ����        {� ��             K.        AbortCurrentRamp                                                                                                                        ����        �z �	             K.        QueryCurrentRampBusy                                                                                                                    ����        �� �             K.        RampFrequency                                                                                                                           ����        �? ��             K.        AbortFrequencyRamp                                                                                                                      ����        �b ��             K.        QueryFrequencyRampBusy                                                                                                                  ����        �� �d             K.        InitiateMeasurement                                                                                                                     ����        �� �             K.        FetchMeasurement                                                                                                                        ����        � ��             K.        FetchMeasurementArray                                                                                                                   ����        �C 	�             K.        reset                                                                                                                                   ����        
  ]             K.        ResetWithDefaults                                                                                                                       ����        � �             K.        Disable                                                                                                                                 ����         *�             K.        self_test                                                                                                                               ����        +� 6V             K.        revision_query                                                                                                                          ����        7R A�             K.        error_query                                                                                                                             ����        B� F�             K.        error_message                                                                                                                           ����        G� Q�             K.        GetSpecificDriverCHandle                                                                                                                ����        Rx \             K.        InvalidateAllAttributes                                                                                                                 ����        \ q�             K.        GetError                                                                                                                                ����        r� �             K.        ClearError                                                                                                                              ����        � ��             K.        GetNextCoercionRecord                                                                                                                   ����        �� �9             K.        GetNextInterchangeWarning                                                                                                               ����        �- ��             K.        ClearInterchangeWarnings                                                                                                                ����        �% �,             K.        ResetInterchangeCheck                                                                                                                   ����        Ʀ ��             K.        LockSession                                                                                                                             ����        ݨ �h             K.        UnlockSession                                                                                                                           ����        �# �             K.        close                                                                                                                                                                                                                              �Initialize                                                                           �Initialize With Options                                                             Configuration Functions                                                              �Configure Voltage Level                                                              �Configure Current Limit                                                              �Configure Output Enabled                                                             �Configure Waveform                                                                   �Configure Voltage Range                                                              �Query Voltage Range Capabilities                                                     �Get Output Phase Name                                                                �Configure Frequency                                                                  �Configure Frequency Range                                                            �Query Frequency Range Capabilities                                                  Phase Angle                                                                          �Configure Phase Angle [PHS]                                                         �Arb Waveform                                                                         �Clear Arb Waveform [ARB]                                                             �Query Arb Waveform Catalog [ARB]                                                     �Write Arb Waveform [ARB]                                                            �Impedance                                                                            �Configure Output Impedance [IMP]                                                     �Query Output Impedance Capabilities [IMP]                                           rVoltage Protection                                                                   �Configure Voltage Protection [VP]                                                    �Query Voltage Protection Tripped [VP]                                                �Reset Voltage Protection [VP]                                                       UCurrent Protection                                                                   �Configure Current Protection [CP]                                                    �Query Current Protection Tripped [CP]                                                �Reset Current Protection [CP]                                                       8DC Generation                                                                        �Configure DC [DG]                                                                    �Configure DC Range [DG]                                                              �Query DC Capabilities [DG]                                                          	External Sync                                                                        �Configure External Sync [ES]                                                         �Query External Sync Locked [ES]                                                     
Set/Get/Check Attribute                                                             
mSet Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             
�Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             �Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           1Action/Status Functions                                                             �Voltage Ramp                                                                         �Ramp Voltage [VR]                                                                    �Abort Voltage Ramp [VR]                                                              �Query Voltage Ramp Busy [VR]                                                        �Current Ramp                                                                         �Ramp Current [CR]                                                                    �Abort Current Ramp [CR]                                                              �Query Current Ramp Busy [CR]                                                        �Frequency Ramp                                                                       �Ramp Frequency [FR]                                                                  �Abort Frequency Ramp [FR]                                                            �Query Frequency Ramp Busy [FR]                                                      $Measurement Functions                                                                �Initiate Measurement [MSR]                                                           �Fetch Measurement [MSR]                                                              �Fetch Measurement Array [MSR]                                                       �Utility Functions                                                                    �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Self-Test                                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Get Specific Driver C Handle                                                         �Invalidate All Attributes                                                           �Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         RCoercion Info                                                                        �Get Next Coercion Record                                                            �Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             �Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           