s��   	     ޝ   X �M  2P   �   ����                                IviScope                        IviScope Class Driver                                                                                 � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr  �    This instrument driver provides programming support for the IviScope Class.   The driver contains all the functions that the IVI Foundation and VXIplug&play Systems Alliance require.  This driver requires the VISA and IVI libraries.

Use this driver to develop programs that are independent of a particular oscilloscope.  You can use this class driver with any oscilloscope that has an IVI instrument-specific driver that is compliant with the IviScope class.  The IviScope class driver accesses the specific driver for your instrument using the configuration information you supply with the IVI configuration utility.

The IviScope class driver divides instrument capabilities into a fundamental capabilities group and multiple extension capability groups.  The IviScopeBase fundamental capabilities group supports oscilloscopes that acquire one waveform after receiving a trigger signal.  This group consists of the following functions and attributes.  These functions and attributes are implemented by all oscilloscope instrument drivers that are compliant with the IviScope class.

      IviScope_Abort()
      IviScope_AcquisitionStatus()
      IviScope_ActualRecordLength()
      IviScope_ConfigureAcquisitionRecord()
      IviScope_ConfigureAcquisitionType()
      IviScope_ConfigureChannel()
      IviScope_ConfigureChanCharacteristics()
      IviScope_ConfigureEdgeTriggerSource()
      IviScope_ConfigureTrigger()
      IviScope_ConfigureTriggerCoupling()
      IviScope_FetchWaveform()
      IviScope_InitiateAcquisition()
      IviScope_IsInvalidWfmElement()
      IviScope_ReadWaveform()
      IviScope_SampleRate()

      IVISCOPE_ATTR_ACQUISITION_START_TIME                                    
      IVISCOPE_ATTR_ACQUISITION_TYPE
      IVISCOPE_ATTR_CHANNEL_ENABLED
      IVISCOPE_ATTR_HORZ_MIN_NUM_PTS
      IVISCOPE_ATTR_HORZ_RECORD_LENGTH
      IVISCOPE_ATTR_HORZ_SAMPLE_RATE
      IVISCOPE_ATTR_HORZ_TIME_PER_RECORD
      IVISCOPE_ATTR_INPUT_IMPEDANCE
      IVISCOPE_ATTR_MAX_INPUT_FREQUENCY
      IVISCOPE_ATTR_PROBE_ATTENUATION
      IVISCOPE_ATTR_TRIGGER_COUPLING
      IVISCOPE_ATTR_TRIGGER_HOLDOFF
      IVISCOPE_ATTR_TRIGGER_LEVEL
      IVISCOPE_ATTR_TRIGGER_SLOPE
      IVISCOPE_ATTR_TRIGGER_SOURCE
      IVISCOPE_ATTR_TRIGGER_TYPE
      IVISCOPE_ATTR_VERTICAL_COUPLING
      IVISCOPE_ATTR_VERTICAL_OFFSET
      IVISCOPE_ATTR_VERTICAL_RANGE

The IviScope class driver identifies functions and attributes that belong to an extension group with the following abbreviations.  Instrument-specific drivers are not required to implement any of the extension capability groups.  If you use functions and attributes that belong to extension capability groups, every instrument-specific driver that you use must implement those extensions.
      
      Extension Capability Group        Abbreviation
      ----------------------------------------------

      IviScopeInterpolation                 [I]
      IviScopeTVTrigger                     [TV]
      IviScopeRuntTrigger                   [RT]
      IviScopeGlitchTrigger                 [GT]
      IviScopeWidthTrigger                  [WT]
      IviScopeAcLineTrigger                 [AT]
      IviScopeWaveformMeas                  [WM]
      IviScopeMinMaxWaveform                [MmW]
      IviScopeProbeAutoSense                [PAS]
      IviScopeContinuousAcquisition         [CA]
      IviScopeAverageAcquisition            [AA]
      IviScopeSampleMode                    [SM]
      IviScopeTriggerModifier               [TM]
      IviScopeAutoSetup                     [AS]

The IviScopeInterpolation extension group provides support for oscilloscopes capable of interpolating values in the waveform record that the oscilloscope's acquisition sub-system was unable to digitize.  This group consists of the following functions and attributes:

      IviScope_ConfigureInterpolation()

      IVISCOPE_ATTR_INTERPOLATION

The IviScopeTVTrigger extension group provides support for instruments capable of acquiring waveforms based on television signal triggers.  This group consists of the following functions and attributes:

      IviScope_ConfigureTVTriggerLineNumber()
      IviScope_ConfigureTVTriggerSource()

      IVISCOPE_ATTR_TV_TRIGGER_EVENT
      IVISCOPE_ATTR_TV_TRIGGER_LINE_NUMBER
      IVISCOPE_ATTR_TV_TRIGGER_POLARITY
      IVISCOPE_ATTR_TV_TRIGGER_SIGNAL_FORMAT

The IviScopeRuntTrigger extension group provides support for instruments capable of acquiring waveforms based on a runt trigger.  This group consists of the following functions and attributes:

      IviScope_ConfigureRuntTriggerSource()

      IVISCOPE_ATTR_RUNT_HIGH_THRESHOLD
      IVISCOPE_ATTR_RUNT_LOW_THRESHOLD
      IVISCOPE_ATTR_RUNT_POLARITY

The IviScopeGlitchTrigger extension group provides support for instruments capable of acquiring waveforms based on a glitch trigger.  This group consists of the following functions and attributes:

      IviScope_ConfigureGlitchTriggerSource()

      IVISCOPE_ATTR_GLITCH_CONDITION
      IVISCOPE_ATTR_GLITCH_POLARITY
      IVISCOPE_ATTR_GLITCH_WIDTH

The IviScopeWidthTrigger extension group provides support for instruments capable of acquiring waveforms based on a width trigger.  This group consists of the following functions and attributes:

      IviScope_ConfigureWidthTriggerSource()

      IVISCOPE_ATTR_WIDTH_CONDITION
      IVISCOPE_ATTR_WIDTH_HIGH_THRESHOLD
      IVISCOPE_ATTR_WIDTH_LOW_THRESHOLD
      IVISCOPE_ATTR_WIDTH_POLARITY

The IviScopeAcLineTrigger extension group provides support for instruments capable of acquiring waveforms based on an AC Line trigger.  This group consists of the following functions and attributes:

      IviScope_ConfigureAcLineTriggerSlope()

      IVISCOPE_ATTR_AC_LINE_TRIGGER_SLOPE

The IviScopeWaveformMeas extension group provides support for instruments capable of calculating measurements from an acquired waveform.  This group consists of the following functions and attributes:

      IviScope_ConfigureRefLevels()
      IviScope_FetchWaveformMeasurement()
      IviScope_ReadWaveformMeasurement()

      IVISCOPE_ATTR_MEAS_HIGH_REF
      IVISCOPE_ATTR_MEAS_LOW_REF
      IVISCOPE_ATTR_MEAS_MID_REF

The IviScopeMinMaxWaveform extension group provides support for instruments capable of acquiring minimum and maximum waveforms that correspond to the same range of time.  This group consists of the following functions and attributes:

      IviScope_ConfigureNumEnvelopes()
      IviScope_FetchMinMaxWaveform()
      IviScope_ReadMinMaxWaveform()

      IVISCOPE_ATTR_NUM_ENVELOPES

The IviScopeProbeAutoSense extension group provides support for instruments that can return the probe attenuation of the attached probe.  This group consists of the following functions and attributes:

      IviScope_AutoProbeSenseValue()

      IVISCOPE_ATTR_PROBE_SENSE_VALUE

The IviScopeContinuousAcquisition extension group provides support for instruments that can perform a continuous acquisition.  This group consists of the following functions and attributes:

      IviScope_ConfigureInitiateContinuous()

      IVISCOPE_ATTR_INITIATE_CONTINUOUS

The IviScopeAverageAcquisition extension group provides support for instruments that can perform average acquisition.  This group consists of the following functions and attributes:

      IviScope_ConfigureNumAverages()

      IVISCOPE_ATTR_NUM_AVERAGES

The IviScopeSampleMode extension group provides support for instruments that can return whether they are using equivalent time or real time sampling to acquire waveforms.  This group consists of the following functions and attributes:

      IviScope_SampleMode()

      IVISCOPE_ATTR_SAMPLE_MODE

The IviScopeTriggerModifier extension group provides support for instruments that can specify the behavior of the triggering subsystem in the absence of the configured trigger.  This group consists of the following functions and attributes:

      IviScope_ConfigureTriggerModifier()

      IVISCOPE_ATTR_TRIGGER_MODIFIER

The IviScopeAutoSetup extension group provides support for instruments that can perform an auto-setup operation.  This group consists of the following function:

      IviScope_AutoSetup()
    "    This class contains functions and sub-classes that configure the oscilloscope.  The class includes high-level functions that configure the acquisition, channel, and trigger subsystems.  The class also contains the low-level functions that set, get, and check individual attribute values.
     I    This class contains functions that configure the acquisition subsystem.     [    This class contains functions that configure the individual channels of the oscilloscope.     �    This class contains functions that configure the trigger subsystem.  To configure the trigger subsystem, first call the IviScope_ConfigureTrigger function.  Then call the trigger configuration function that corresponds to the trigger type you specify.     I    This class contains functions that configure the measurement subsystem.     X    This class contains functions that return information about the current configuration.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.    �    This class contains functions and sub-classes that initiate and retrieve waveforms and waveform measurements using the current configuration.  The class contains high-level read functions that intiate an acquisition and fetch the data in one operation.  The class also contains low-level functions that intiate an acquisition, and fetch a waveform or wavefrom measurement in separate operations.
    Q    The class contains functions that give low-level control over how the oscilloscope acquires waveforms and waveform measurements.  The functions perform the following operations:

- intiate an acquisition
- send a software trigger
- return the status of acquisition 
- fetch a waveform or waveform measurement
- abort an acquisition  

    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     ?    This class contains functions that retrieve coercion records.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    )    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specific driver using the logical name of the IVI driver session.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviScope_LockSession and IviScope_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleScope"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviScope_LockSession and IviScope_UnlockSession to protect sections of code that require exclusive access to the resource.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    3� =   �  �    Logical Name                      7i : �       ID Query                          9t =� �       Reset Device                      :. �C �  �    Instrument Handle                 <�#����  �    Status                             "SampleScope"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          )    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specific driver using the logical name of the IVI driver session.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviScope_LockSession and IviScope_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleScope"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviScope_LockSession and IviScope_UnlockSession to protect sections of code that require exclusive access to the resource.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVISCOPE_ATTR_RANGE_CHECK
QueryInstrStatus  IVISCOPE_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVISCOPE_ATTR_CACHE   
Simulate          IVISCOPE_ATTR_SIMULATE  
RecordCoercions   IVISCOPE_ATTR_RECORD_COERCIONS
InterchangeCheck  IVISCOPE_ATTR_INTERCHANGE_CHECK

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the driver uses the values from the Measurement and Automation Explorer's IVI Configuration Utility.   You can override these values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, the driver uses the value from the IVI Configuration Utility.  

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    K� =   �  �    Logical Name                      Ou : �       ID Query                          Q� =� �       Reset Device                      R: �a �  �    Instrument Handle                 T�#����  �    Status                            \ �  � �    Option String                      "SampleScope"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    g    This function configures how the oscilloscope acquires data and how it fills the waveform record.  

     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    2    Specify the manner in which you want the oscilloscope to acquire data and fill the waveform record.  The driver sets the IVISCOPE_ATTR_ACQUISITION_TYPE to this value. 

Defined Values:
- IVISCOPE_VAL_NORMAL - Sets the oscilloscope to
  the normal acquisition mode.  The oscilloscope acquires one
  sample for each point in the waveform record.  The   
  oscilloscope can use real-time or equivalent-time sampling.

- IVISCOPE_VAL_PEAK_DETECT - Sets the oscilloscope
  to the peak-detect acquisition mode.  The oscilloscope 
  oversamples the input signal and keeps the minimum and
  maximum values that correspond to each position in the 
  waveform record.  The oscilloscope uses only real-time
  sampling.

- IVISCOPE_VAL_HI_RES - Sets the oscilloscope to
  the high-resolution acquisition mode.  The oscilloscope
  oversamples the input signal and calculates an average 
  value for each position in the waveform record.  The
  oscilloscope uses only real-time sampling.

- IVISCOPE_VAL_ENVELOPE - Sets the oscilloscope to
  the envelope acquisition mode.  The oscilloscope acquires
  multiple waveforms and keeps the minimum and maximum voltages
  it acquires for each point in the waveform record.  You 
  specify the number of waveforms the oscilloscope acquires with
  the IviScope_ConfigureNumEnvelopes function.  The
  oscilloscope can use real-time or equivalent-time sampling.

- IVISCOPE_VAL_AVERAGE - Sets the oscilloscope to
  the average acquisition mode.  The oscilloscope acquires
  multiple waveforms and calculates an average value for each
  point in the waveform record.  You specify the number of 
  waveforms the oscilloscope acquires with the 
  IviScope_ConfigureNumAverages function.  The
  oscilloscope can use real-time or equivalent-time sampling.  

Default value: IVISCOPE_VAL_NORMAL

Notes:

(1) When you set this parameter to IVISCOPE_VAL_ENVELOPE or IVISCOPE_VAL_PEAK_DETECT, the oscilloscope acquires minimum and maximum waveforms.  To retrieve the minimum and maximum waveforms, use the IviScope_ReadMinMaxWaveform and IviScope_FetchMinMaxWaveform functions.

    d)-   �  �    Instrument Handle                 d�#����  �    Status                            l V �  �    Acquisition Type                       	                      �Normal IVISCOPE_VAL_NORMAL Peak Detect IVISCOPE_VAL_PEAK_DETECT High Resolution IVISCOPE_VAL_HI_RES Envelope IVISCOPE_VAL_ENVELOPE Average IVISCOPE_VAL_AVERAGE    �    This function configures the most commonly configured attributes of the oscilloscope acquisition subsystem. These attributes are the time per record, minimum record length, and the acquisition start time.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Pass the time per record.  The driver uses this value to set the IVISCOPE_ATTR_HORZ_TIME_PER_RECORD attribute.

Units: seconds

Default Value: None        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the minimum number of points the end-user allows in the waveform recorded.  The driver uses this value to set the IVISCOPE_ATTR_HORZ_MIN_NUM_PTS attribute.  Call the IviScope_ActualRecordLength function to obtain the actual record length.

Default Value: None

Notes:

(1) The oscilloscope may use records of different size depending on the acquisition type.  You specify the acquisition type with the IviScope_ConfigureAcquisitionType function.    �    Pass the position of the first point in the waveform record relative to the trigger event. The driver uses this value to set the IVISCOPE_ATTR_ACQUISITION_START_TIME attribute. 

Specify the length of time from the trigger event to the first point in the waveform record.  If this value is positive, the first point in the waveform record occurs after the trigger event.  If this value is negative, the first point in the waveform record occurs before the trigger event.

Units: seconds

Default Value: 0.0    vs-   �  �    Instrument Handle                 w- =  �  �    Time Per Record (seconds)         w�#����  �    Status                            ~� = � �  �    Minimum Record Length             �� =~ �  �    Start Time (seconds)                       	               0.0   �    When you set the acquisition type to IVISCOPE_VAL_AVERAGE, the oscilloscope acquires multiple waveforms.  After each waveform acquisition, the oscilloscope keeps the average value of all acquisitions for each element in the waveform record.  This function configures the number of waveforms that the oscilloscope  acquires and averages.  After the oscilloscope acquires as many waveforms as you specify, it returns to the idle state.  

Notes:

(1) Set the acquisition type to IVISCOPE_VAL_AVERAGE before you call this function.  To set the acquisition type, call the IviScope_ConfigureAcquisitionType function. 

(2) This function is part of the IviScopeAverageAcquisition [AA] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    #    When you set the acquisition type to IVISCOPE_VAL_AVERAGE, the oscilloscope acquires multiple waveforms.  After each waveform acquisition, the oscilloscope keeps the average value of all acquisitions for each element in the waveform record.  This parameter specifies the number of waveforms the oscilloscope acquires and averages.  The driver sets the IVISCOPE_ATTR_NUM_AVERAGES attribute to this value.  

Default value: None

Notes:

(1) This parameter affects instrument behavior only when the acquisition type is set to IVISCOPE_VAL_AVERAGE.    ��-   �  �    Instrument Handle                 �`#����  �    Status                            �� V � �  �    Number of Averages                     	              �    When you set the acquisition type to IVISCOPE_VAL_ENVELOPE, the oscilloscope acquires multiple waveforms.  After each waveform acquisition, the oscilloscope keeps the minimum and maximum values it finds for each element in the waveform record.  This function configures the number of waveforms the oscilloscope acquires and analyzes to create the minimum and maximum waveforms.  After the oscilloscope acquires as many waveforms as you specify, it returns to the idle state.  

Notes:

(1) Set the acquisition type to IVISCOPE_VAL_ENVELOPE before you call this function.  To set the acquisition type, call the IviScope_ConfigureAcquisitionType function. 

(2) This function is part of the IviScopeMinMaxWaveform [MmW] extension group.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    R    When you set the acquisition type to IVISCOPE_VAL_ENVELOPE, the oscilloscope acquires multiple waveforms.  After each waveform acquisition, the oscilloscope keeps the minimum and maximum values it finds for each point in the waveform record.  This parameter specifies the number of waveforms the oscilloscope acquires and analyzes to create the minimum and maximum waveforms.  The driver sets the IVISCOPE_ATTR_NUM_ENVELOPES attribute to this value.  

Default value: None

Notes:

(1) This parameter affects instrument behavior only when the acquisition type is set to IVISCOPE_VAL_ENVELOPE.    �H-   �  �    Instrument Handle                 �#����  �    Status                            �$ V � �  �    Number of Envelopes                    	               �    This function configures the interpolation method the oscilloscope uses when it cannot sample a voltage for a point in the waveform record.  

Notes:

(1) This function is part of the IviScopeInterpolation [I] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
         
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the interpolation method you want the oscilloscope to 
use when it cannot sample a voltage for a point in the waveform record.  The driver sets the IVISCOPE_ATTR_INTERPOLATION attribute to this value.


Defined Values:
  IVISCOPE_VAL_NO_INTERPOLATION - No interpolation
  IVISCOPE_VAL_SINE_X           - sin(x)/x interpolation
  IVISCOPE_VAL_LINEAR           - Linear interpolation
  
Default value:  IVISCOPE_VAL_SINE_X

Notes:

(1)  IVISCOPE_VAL_NO_INTERPOLATION - The oscilloscope does not interpolate any points in the waveform.  
Instead, the driver sets every element in the waveform array for which the oscilloscope cannot sample a value to an IEEE define Nan (Not a Number) value.
    �-   �  �    Instrument Handle                 ��#����  �    Status                            �� V- �  �    Interpolation                          	                      uNo Interpolation IVISCOPE_VAL_NO_INTERPOLATION sin(x)/x IVISCOPE_VAL_SINE_X Linear Interpolation IVISCOPE_VAL_LINEAR    �    This function configures the oscilloscope to perform continuous acquisition.

Notes:

(1) This function is part of the IviScopeContinuousAcquisition [CA] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Specifies whether you want to enable continuous acquisition on the oscilloscope.  The driver uses this value to set the IVISCOPE_ATTR_INITIATE_CONTINUOUS attribute.

Valid Values:
VI_TRUE  - Continuous Initiate Enabled
VI_FALSE - Continuous Initiate Disabled

Default Value:  VI_FALSE    ��-   �  �    Instrument Handle                 �[#����  �    Status                            �} Y � �       Continuous Acquisition                 	         "  Enabled VI_TRUE Disabled VI_FALSE    �    This function configures the most commonly configured attributes of the oscilloscope channel sub-system.  These attributes are the range, offset, coupling, probe attenuation, and whether the channel is enabled.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.    2    Pass the value of the input range the oscilloscope uses for the channel.  The driver sets the IVISCOPE_ATTR_VERTICAL_RANGE attribute to this value.
For example, to acquire a sine wave that spans between -5.0 and 5.0 volts, pass 10.0 as the value of this parameter.

Units:  volts
  
Default Value: None

    g    Pass the location of the center of the range that you specify with the Vertical Range parameter.  Express the value with respect to ground.  The driver sets the IVISCOPE_ATTR_VERTICAL_OFFSET to this value.

For example, to acquire a sine wave that spans between 0.0 and 10.0 volts, pass 5.0 as the value of this parameter.

Units:  volts

Default Value: 0.0        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    ;    Specify how you want the oscilloscope to couple the input signal for the channel.  The driver sets the IVISCOPE_ATTR_VERTICAL_COUPLING attribute to this value.

Defined Values:
  IVISCOPE_VAL_AC  - AC Coupling
  IVISCOPE_VAL_DC  - DC Coupling
  IVISCOPE_VAL_GND - Ground Coupling

Default value: IVISCOPE_VAL_DC

    +    Pass the scaling factor by which the probe you attach to the channel attenuates the input.  For example, when you use a 10:1 probe, set this parameter to 10.0.  The driver sets the IVISCOPE_ATTR_PROBE_ATTENUATION attribute to this value.

This driver reserves negative values to control the oscilloscope's automatic probe sense capability.  Setting this parameter to IVISCOPE_VAL_PROBE_SENSE_ON configures the oscilloscope to sense the attenuation of the probe automatically.  

Defined Values:
 IVISCOPE_VAL_PROBE_SENSE_ON - Enables the oscilloscope's
automatic probe sense capability.

Default Value: 1.0

Notes:

(1) If the oscilloscope is set to sense the probe attenuation automatically, setting this parameter to a positive value disables the automatic probe sense and configures the oscilloscope to use the manual probe attenuation you specify.

(2) If you use a manual probe attenuation, you must set the probe attenuation to reflect the new probe attenuation each time you attach a different probe.

(3) Use the IviScope_AutoProbeSenseValue function to obtain the actual probe attenuation while the automatic probe sense capability is enabled.

(4) If you set the oscilloscope to sense the probe attenuation automatically, the probe attenuation value can change at any time.  When the oscilloscope detects a new probe attenuation value, other settings in the oscilloscope might also change.  The driver has no way of knowing when these changes occur.  Therefore, when you enable the automatic probe sense capability, this driver disables caching for attributes that depend on the probe attenuation.  These attributes include IVISCOPE_ATTR_VERTICAL_RANGE, IVISCOPE_ATTR_VERTICAL_OFFSET, and all the attributes that configure trigger levels.  To maximize performance, set this parameter to a manual probe attenuation setting.
    �    Specify whether you want the oscilloscope to acquire a waveform for the channel when you call the  IviScope_InitiateAcquisition, IviScope_ReadWaveform, IviScope_ReadMinMaxWaveform, or IviScope_ReadWaveformMeasurement function.  The driver sets the IVISCOPE_ATTR_CHANNEL_ENABLED attribute to this value. 

Valid Values:
VI_TRUE  - Channel Enabled
VI_FALSE - Channel Disabled
 
Default Value: VI_TRUE
    �S-   �  �    Instrument Handle                 � =  �  �    Channel Name                      �� = � �  �    Vertical Range                    �4 =~ �  �    Vertical Offset                   ��#����  �    Status                            �� � e �  �    Vertical Coupling                 � � � �  �    Probe Attenuation                 �; �� �  �    Channel Enabled                        ""        0.0    	                     ;AC IVISCOPE_VAL_AC DC IVISCOPE_VAL_DC GND IVISCOPE_VAL_GND    1.0   True VI_TRUE False VI_FALSE    �    This function configures the attributes that control the electrical characteristics of the channel.  These attributes are the input impedance and the maximum frequency of the input signal.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Pass the maximum frequency for the input signal you want the instrument to accommodate without attenuating it by more than 3dB.  The driver sets the IVISCOPE_ATTR_MAX_INPUT_FREQUENCY to this value. 

Units:  hertz.

Default value:  none        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Pass the input impedance you want to use for the channel.  The driver sets the IVISCOPE_ATTR_INPUT_IMPEDANCE to this value.

Units:  ohms

Default Value:  1000000.0    ��-   �  �    Instrument Handle                 Ӎ Q  �  �    Channel Name                      �z Q~ �  �    Max Input Frequency (hertz)       �p#����  �    Status                            ߒ Q � �  �    Input Impedance (ohms)                 ""        	           
1000000.0   .    This function configures the common attributes of the trigger subsystem.  These attributes are the trigger type and holdoff.

When you call IviScope_ReadWaveform, IviScope_ReadWaveformMeasurement, IviScope_ReadMinMaxWaveform, or IviScope_InitiateAcquisition, the oscilloscope waits for a trigger.  You specify the type of trigger for which the oscilloscope waits with the Trigger Type parameter.

If the oscilloscope requires multiple waveform acquisitions to build a complete waveform, it waits for the length of time you specify with the Holdoff parameter to elapse since the previous trigger.  The oscilloscope then waits for the next trigger.  Once the oscilloscope acquires a complete waveform, it returns to the Idle state.

Notes:

(1) After you call this function, you must call the trigger configuration function that corresponds to the Trigger Type you select to completely specify the trigger.  For example, if you set the Trigger Type to IVISCOPE_VAL_EDGE_TRIGGER, you use the IviScope_ConfigureEdgeTriggerSource function to completely specify the trigger.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Pass the type of trigger you want the oscilloscope to use.  The driver sets the IVISCOPE_ATTR_TRIGGER_TYPE to this value.  

Defined Values:

- IVISCOPE_VAL_EDGE_TRIGGER - Configures the oscilloscope
  for edge triggering.  An edge trigger occurs when the trigger
  signal crosses the trigger level you specify with the slope
  you specify.  You configure the trigger level and slope with
  the IviScope_ConfigureEdgeTriggerSource function.

- IVISCOPE_VAL_TV_TRIGGER - Configures the oscilloscope for
  TV triggering.  You configure the TV signal type, the field
  and line on which to trigger, and the signal polarity with the
  IviScope_ConfigureTVTriggerSource and
  IviScope_ConfigureTVTriggerLineNumber functions.

- IVISCOPE_VAL_RUNT_TRIGGER - Configures the oscilloscope 
  for runt triggering.  A runt trigger occurs when the trigger
  signal crosses one of the runt thresholds twice without
  crossing the other runt threshold.  You configure the runt
  thresholds and the polarity of the runt with the
  IviScope_ConfigureRuntTriggerSource function.

 IVISCOPE_VAL_GLITCH_TRIGGER - Configures the oscilloscope
  for glitch triggering.  A glitch trigger occurs when the
  trigger signal has a pulse with a width that is less than the
  glitch width.  The trigger does not actually occur until the
  edge of the pulse that corresponds to the glitch width and 
  polarity you specify crosses the trigger level.  You configure
  the glitch width, the polarity of the pulse, and the trigger
  level with the IviScope_ConfigureGlitchTriggerSource
  function.

- IVISCOPE_VAL_WIDTH_TRIGGER - Configures the oscilloscope
  for width triggering.  A width trigger occurs when the 
  oscilloscope detects a positive or negative pulse with a width
  between, or optionally outside, the width thresholds.  The 
  trigger does not actually occur until the edge of a pulse 
  that corresponds to the width thresholds and polarity you
  specify crosses the trigger level.  You configure the width
  thresholds, whether to trigger on pulse widths that are within
  or outside the width thresholds, the polarity of the pulse,
  and the trigger level with the 
  IviScope_ConfigureWidthTriggerSource function.
  
- IVISCOPE_VAL_AC_LINE_TRIGGER - Configures the oscilloscope for
  AC Line triggering.  You configure the slope on which to 
  trigger with the IviScope_ConfigureAcLineTriggerSlope
  function.

- IVISCOPE_VAL_IMMEDIATE_TRIGGER - Configures the oscilloscope
  for immediate triggering. The oscilloscope does not wait for
  trigger of any kind upon initialization.

Default Value: IVISCOPE_VAL_EDGE_TRIGGER

Notes:

(1) This control configures the type of trigger the oscilloscope uses.  After you call this function, you must call the appropriate trigger configuration function to completely specify the trigger.    :    Pass the length of time you want the oscilloscope to wait after it detects a trigger until the oscilloscope enables the trigger subsystem to detect another trigger.  The driver sets the IVISCOPE_ATTR_TRIGGER_HOLDOFF attribute to this value.

This parameter affects instrument operation only when the oscilloscope requires multiple acquisitions to build a complete waveform.  The oscilloscope requires multiple waveform acquisitions when it uses equivalent-time sampling or when you set the acquisition type to envelope or average.

Units:  seconds

Default Value: None        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �-   �  �    Instrument Handle                 �` = ^ � �    Trigger Type                      �j =: �  �    Trigger Holdoff (seconds)         �#����  �    Status                                            �Edge IVISCOPE_VAL_EDGE_TRIGGER TV IVISCOPE_VAL_TV_TRIGGER Runt IVISCOPE_VAL_RUNT_TRIGGER Glitch IVISCOPE_VAL_GLITCH_TRIGGER Width IVISCOPE_VAL_WIDTH_TRIGGER AC Line IVISCOPE_VAL_AC_LINE_TRIGGER Immediate IVISCOPE_VAL_IMMEDIATE_TRIGGER        	           2    This function configures the trigger coupling.

     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the trigger coupling.  The driver uses this value to set the IVISCOPE_ATTR_TRIGGER_COUPLING attribute. 

Defined Values:

- IVISCOPE_VAL_AC - The oscilloscope AC couples the trigger
                    signal.

- IVISCOPE_VAL_DC - The oscilloscope DC couples the trigger
                    signal.

- IVISCOPE_VAL_LF_REJECT - The oscilloscope filters out the low
                           frequencies from the trigger signal.

- IVISCOPE_VAL_HF_REJECT - The oscilloscope filters out the high
                           frequencies from the trigger signal.

- IVISCOPE_VAL_NOISE_REJECT - The oscilloscope filters out the
                              noise from the trigger signal.

Default Value: IVISCOPE_VAL_DC

    ��-   �  �    Instrument Handle                 ��#����  �    Status                           � Q �  �    Trigger Coupling                       	                     �AC IVISCOPE_VAL_AC DC IVISCOPE_VAL_DC LF Reject IVISCOPE_VAL_LF_REJECT HF Reject IVISCOPE_VAL_HF_REJECT Noise Reject IVISCOPE_VAL_NOISE_REJECT    �    This function configures the trigger modifier.  The trigger modifier determines the oscilloscope's behavior in the absence of the configured trigger.

Notes:

(1) This function is part of the IviScopeTriggerModifier [TM] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the trigger modifier.  The driver uses this value to set the IVISCOPE_ATTR_TRIGGER_MODIFIER attribute. 

Defined Values:
- IVISCOPE_VAL_NO_TRIGGER_MOD - The oscilloscope waits until the
                                trigger you specify occurs.

- IVISCOPE_VAL_AUTO - The oscilloscope automatically triggers if
                      the trigger you specify does not occur
                      within the oscilloscope's timeout period.

- IVISCOPE_VAL_AUTO_LEVEL - The oscilloscope adjusts the trigger
                            level if the trigger you specify
                            does not occur.

Default Value: IVISCOPE_VAL_NO_TRIGGER_MOD

   	�-   �  �    Instrument Handle                
�#����  �    Status                           � Q �  �    Trigger Modifier                       	                      [None IVISCOPE_VAL_NO_TRIGGER_MOD Auto IVISCOPE_VAL_AUTO Auto Level IVISCOPE_VAL_AUTO_LEVEL   �    This function configures the edge trigger.  An edge trigger occurs when the trigger signal passes through the voltage threshold that you specify with the Trigger Level parameter and has the slope that you specify with the Trigger Slope parameter.  

Notes:

(1) This function affects instrument behavior only if the trigger type is IVISCOPE_VAL_EDGE_TRIGGER.  Call the IviScope_ConfigureTrigger and IviScope_ConfigureTriggerCoupling functions to set the trigger type and trigger coupling before calling this function.

(2) If the trigger source is one of the analog input channels, you must configure the vertical range, vertical offset, vertical coupling, probe attenuation, and the maximum input frequency before calling this function.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the voltage threshold you want the oscilloscope to use for edge triggering.  The driver sets the IVISCOPE_ATTR_TRIGGER_LEVEL attribute to this value.

The oscilloscope triggers when the trigger signal passes through the threshold you specify with this parameter and has the slope you specify with the Trigger Slope parameter.

Units:  volts

Default Value: 0.0

Notes:

(1) This parameter affects instrument behavior only when you select a channel or the external trigger input as the Trigger Source.  You cannot configure the trigger level that the oscilloscope uses for other trigger sources.  For example, if you select IVISCOPE_VAL_AC_LINE_TRIGGER as the trigger source, the oscilloscope triggers on zero crossings.    I    Specify whether you want a rising edge or a falling edge passing through the Trigger Level to trigger the oscilloscope.  The driver sets the IVISCOPE_ATTR_TRIGGER_SLOPE attribute to this value.

Defined Values:
  IVISCOPE_VAL_POSITIVE - Rising edge
  IVISCOPE_VAL_NEGATIVE - Falling edge

Default value: IVISCOPE_VAL_POSITIVE

    �    Pass the source you want the oscilloscope to monitor for a trigger.  The driver sets the IVISCOPE_ATTR_TRIGGER_SOURCE attribute to this value. 

After you call one of the IviScope_ReadWaveform, IviScope_ReadMinMaxWaveform, IviScope_ReadWaveformMeasurement, or IviScope_InitiateAcquisition functions, the oscilloscope waits for the trigger from the source you specify in this parameter.

This control accepts one of the valid channel names or additional trigger sources listed below.  

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.


Defined Values:
(Additional Trigger Sources)

IVISCOPE_VAL_EXTERNAL     - External
IVISCOPE_VAL_TTL0         - PXI TRIG0 or VXI TTL0
IVISCOPE_VAL_TTL1         - PXI TRIG1 or VXI TTL1
IVISCOPE_VAL_TTL2         - PXI TRIG2 or VXI TTL2
IVISCOPE_VAL_TTL3         - PXI TRIG3 or VXI TTL3
IVISCOPE_VAL_TTL4         - PXI TRIG4 or VXI TTL4
IVISCOPE_VAL_TTL5         - PXI TRIG5 or VXI TTL5
IVISCOPE_VAL_TTL6         - PXI TRIG6 or VXI TTL6
IVISCOPE_VAL_TTL7         - PXI TRIG7 or VXI TTL7
IVISCOPE_VAL_ECL0         - VXI ECL0
IVISCOPE_VAL_ECL1         - VXI ECL1
IVISCOPE_VAL_PXI_STAR     - PXI Star
IVISCOPE_VAL_RTSI_0       - RTSI line 0
IVISCOPE_VAL_RTSI_1       - RTSI line 1
IVISCOPE_VAL_RTSI_2       - RTSI line 2
IVISCOPE_VAL_RTSI_3       - RTSI line 3
IVISCOPE_VAL_RTSI_4       - RTSI line 4
IVISCOPE_VAL_RTSI_5       - RTSI line 5
IVISCOPE_VAL_RTSI_6       - RTSI line 6

Notes:

(1) IVISCOPE_VAL_EXTERNAL - The oscilloscope waits for a trigger on the external trigger input.
   c-   �  �    Instrument Handle                #����  �    Status                            ? = � �  �    Trigger Level (volts)            # =� �  �    Trigger Slope                    $n = ) � �    Trigger Source                         	           0.0               >Positive IVISCOPE_VAL_POSITIVE Negative IVISCOPE_VAL_NEGATIVE              iExternal IVISCOPE_VAL_EXTERNAL PXI TRIG0 or VXI TTL0 IVISCOPE_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVISCOPE_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVISCOPE_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVISCOPE_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVISCOPE_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVISCOPE_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVISCOPE_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVISCOPE_VAL_TTL7 ECL0 IVISCOPE_VAL_ECL0 ECL1 IVISCOPE_VAL_ECL1 PXI Star IVISCOPE_VAL_PXI_STAR RTSI 0 IVISCOPE_VAL_RTSI_0 RTSI 1 IVISCOPE_VAL_RTSI_1 RTSI 2 IVISCOPE_VAL_RTSI_2 RTSI 3 IVISCOPE_VAL_RTSI_3 RTSI 4 IVISCOPE_VAL_RTSI_4 RTSI 5 IVISCOPE_VAL_RTSI_5 RTSI 6 IVISCOPE_VAL_RTSI_6   �    This function configures the oscilloscope for TV triggering. It configures the TV signal format, the event and the signal polarity.

Notes:

(1) This function affects instrument behavior only if the trigger type is IVISCOPE_VAL_TV_TRIGGER. Call the IviScope_ConfigureTrigger and IviScope_ConfigureTriggerCoupling functions to set the trigger type and trigger coupling before calling this function.

(2) This function is part of the IviScopeTVTrigger [TV] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    G    Pass the type of TV signal on which the oscilloscope triggers.  The driver sets the IVISCOPE_ATTR_TV_TRIGGER_SIGNAL_FORMAT attribute to this value.

Defined Values:
  IVISCOPE_VAL_NTSC  - NTSC video signal
  IVISCOPE_VAL_PAL   - PAL video signal
  IVISCOPE_VAL_SECAM - SECAM video signal

Default Value:  IVISCOPE_VAL_NTSC  
    �    Pass the TV event on which you want the oscilloscope to trigger.  The driver sets the IVISCOPE_ATTR_TV_TRIGGER_EVENT attribute to this value.

Defined Values:
  IVISCOPE_VAL_TV_EVENT_FIELD1      - Trigger on field 1
  IVISCOPE_VAL_TV_EVENT_FIELD2      - Trigger on field 2
  IVISCOPE_VAL_TV_EVENT_ANY_FIELD   - Trigger on any field
  IVISCOPE_VAL_TV_EVENT_ANY_LINE    - Trigger on any line
  IVISCOPE_VAL_TV_EVENT_LINE_NUMBER - Trigger on a line you specify

Default Value:  IVISCOPE_VAL_TV_EVENT_FIELD1  

Notes:

(1) If you specify IVISCOPE_VAL_TV_EVENT_LINE_NUMBER, you must set the line number on which the oscilloscope triggers by calling
the IviScope_ConfigureTVTriggerLineNumber function.
    ,    Pass the polarity of the TV signal.  The driver sets the IVISCOPE_ATTR_TV_TRIGGER_POLARITY attribute to this value.

Defined Values:
  IVISCOPE_VAL_TV_POSITIVE - Trigger on a positive video sync 
  IVISCOPE_VAL_TV_NEGATIVE - Trigger on a negative video sync

Default value: IVISCOPE_VAL_TV_POSITIVE    �    Pass the source you want the oscilloscope to monitor for a trigger.  The driver sets the IVISCOPE_ATTR_TRIGGER_SOURCE attribute to this value. 

After you call one of the IviScope_ReadWaveform, IviScope_ReadMinMaxWaveform, IviScope_ReadWaveformMeasurement, or IviScope_InitiateAcquisition functions, the oscilloscope waits for the trigger from the source you specify in this parameter.

This control accepts one of the valid channel names or additional trigger sources listed below.  

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.


Defined Values:
(Additional Trigger Sources)

IVISCOPE_VAL_EXTERNAL     - External
IVISCOPE_VAL_TTL0         - PXI TRIG0 or VXI TTL0
IVISCOPE_VAL_TTL1         - PXI TRIG1 or VXI TTL1
IVISCOPE_VAL_TTL2         - PXI TRIG2 or VXI TTL2
IVISCOPE_VAL_TTL3         - PXI TRIG3 or VXI TTL3
IVISCOPE_VAL_TTL4         - PXI TRIG4 or VXI TTL4
IVISCOPE_VAL_TTL5         - PXI TRIG5 or VXI TTL5
IVISCOPE_VAL_TTL6         - PXI TRIG6 or VXI TTL6
IVISCOPE_VAL_TTL7         - PXI TRIG7 or VXI TTL7
IVISCOPE_VAL_ECL0         - VXI ECL0
IVISCOPE_VAL_ECL1         - VXI ECL1
IVISCOPE_VAL_PXI_STAR     - PXI Star
IVISCOPE_VAL_RTSI_0       - RTSI line 0
IVISCOPE_VAL_RTSI_1       - RTSI line 1
IVISCOPE_VAL_RTSI_2       - RTSI line 2
IVISCOPE_VAL_RTSI_3       - RTSI line 3
IVISCOPE_VAL_RTSI_4       - RTSI line 4
IVISCOPE_VAL_RTSI_5       - RTSI line 5
IVISCOPE_VAL_RTSI_6       - RTSI line 6

Notes:

(1) IVISCOPE_VAL_EXTERNAL - The oscilloscope waits for a trigger on the external trigger input.
   2�-   �  �    Instrument Handle                3�#����  �    Status                           :� =, �  �    TV Signal Format                 <) =� �  �    TV Event                         >� �� �  �    Trigger Polarity                 @ = ) � �    Trigger Source                         	                      ENTSC IVISCOPE_VAL_NTSC PAL IVISCOPE_VAL_PAL SECAM IVISCOPE_VAL_SECAM               �Field 1 IVISCOPE_VAL_TV_EVENT_FIELD1 Field 2 IVISCOPE_VAL_TV_EVENT_FIELD2 Any Field IVISCOPE_VAL_TV_EVENT_ANY_FIELD Any Line IVISCOPE_VAL_TV_EVENT_ANY_LINE Line Number IVISCOPE_VAL_TV_EVENT_LINE_NUMBER               DPositive IVISCOPE_VAL_TV_POSITIVE Negative IVISCOPE_VAL_TV_NEGATIVE              iExternal IVISCOPE_VAL_EXTERNAL PXI TRIG0 or VXI TTL0 IVISCOPE_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVISCOPE_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVISCOPE_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVISCOPE_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVISCOPE_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVISCOPE_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVISCOPE_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVISCOPE_VAL_TTL7 ECL0 IVISCOPE_VAL_ECL0 ECL1 IVISCOPE_VAL_ECL1 PXI Star IVISCOPE_VAL_PXI_STAR RTSI 0 IVISCOPE_VAL_RTSI_0 RTSI 1 IVISCOPE_VAL_RTSI_1 RTSI 2 IVISCOPE_VAL_RTSI_2 RTSI 3 IVISCOPE_VAL_RTSI_3 RTSI 4 IVISCOPE_VAL_RTSI_4 RTSI 5 IVISCOPE_VAL_RTSI_5 RTSI 6 IVISCOPE_VAL_RTSI_6   ?    This function configures the TV line upon which the oscilloscope triggers.  The line number is absolute and not relative to the field of the TV signal.

Notes:

(1) This function affects instrument behavior only if the trigger type is set to IVISCOPE_VAL_TV_TRIGGER and the TV trigger event is set to IVISCOPE_VAL_TV_EVENT_LINE_NUMBER.  Call the IviScope_ConfigureTrigger and the IviScope_ConfigureTVTriggerSource functions to set the trigger type and TV trigger event before calling this function.

(2) This function is part of the IviScopeTVTrigger [TV] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    i    Pass the line on which you want the oscilloscope to trigger.  The driver sets the IVISCOPE_ATTR_TV_TRIGGER_LINE_NUMBER attribute to this value.

The line number is independent of the field.  This means that to trigger on the first line of the second field, you must specify a line number of 263 (if we presume that field one had 262 lines).

Default Value: 1
   Pu-   �  �    Instrument Handle                Q/#����  �    Status                           XQ Q � �  �    Line Number                            	           1   �    This function configures the runt trigger.  A runt trigger occurs when the trigger signal crosses one of the runt thresholds twice without crossing the other runt threshold.  You specify the runt thresholds with the  Runt Low Threshold and Runt High Threshold parameters.  You specify the polarity of the runt with the Runt Polarity parameter.

Notes:

(1)  This function affects instrument behavior only if the trigger type is IVISCOPE_VAL_RUNT_TRIGGER.  Call the IviScope_ConfigureTrigger and IviScope_ConfigureTriggerCoupling functions to set the trigger type and trigger coupling before calling this function.

(2) This function is part of the IviScopeRuntTrigger [RT] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Pass the high threshold you want the oscilloscope to use for runt triggering.  The driver sets the IVISCOPE_ATTR_RUNT_HIGH_THRESHOLD attribute to this value.

Units:  volts

Default Value:  4.0

     �    Pass the low threshold you want the oscilloscope to use for runt triggering.  The driver sets the IVISCOPE_ATTR_RUNT_LOW_THRESHOLD attribute to this value.

Units:  volts

Default Value:  1.0

    !    Pass the polarity of the runt that you want to trigger the oscilloscope.  The driver sets the IVISCOPE_ATTR_RUNT_POLARITY attribute to this value.

Defined Values:
- IVISCOPE_VAL_RUNT_POSITIVE - The oscilloscope
  triggers on a positive runt.  A positive runt occurs when
  a rising edge crosses the Runt Low Threshold and does not
  cross the Runt High Threshold before re-crossing the Low Runt
  Threshold.

- IVISCOPE_VAL_RUNT_NEGATIVE - The oscilloscope
  triggers on a negative runt.  A negative runt occurs when
  a falling edge crosses the Runt High Threshold and does not
  cross the Runt Low Threshold before re-crossing the High Runt
  Threshold.

- IVISCOPE_VAL_RUNT_EITHER - The oscilloscope
  triggers on either a positive or negative runt.

Default Value:  IVISCOPE_VAL_RUNT_POSITIVE

    �    Pass the source you want the oscilloscope to monitor for a trigger.  The driver sets the IVISCOPE_ATTR_TRIGGER_SOURCE attribute to this value. 

After you call one of the IviScope_ReadWaveform, IviScope_ReadMinMaxWaveform, IviScope_ReadWaveformMeasurement, or IviScope_InitiateAcquisition functions, the oscilloscope waits for the trigger from the source you specify in this parameter.

This control accepts one of the valid channel names or additional trigger sources listed below.  

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.


Defined Values:
(Additional Trigger Sources)

IVISCOPE_VAL_EXTERNAL     - External
IVISCOPE_VAL_TTL0         - PXI TRIG0 or VXI TTL0
IVISCOPE_VAL_TTL1         - PXI TRIG1 or VXI TTL1
IVISCOPE_VAL_TTL2         - PXI TRIG2 or VXI TTL2
IVISCOPE_VAL_TTL3         - PXI TRIG3 or VXI TTL3
IVISCOPE_VAL_TTL4         - PXI TRIG4 or VXI TTL4
IVISCOPE_VAL_TTL5         - PXI TRIG5 or VXI TTL5
IVISCOPE_VAL_TTL6         - PXI TRIG6 or VXI TTL6
IVISCOPE_VAL_TTL7         - PXI TRIG7 or VXI TTL7
IVISCOPE_VAL_ECL0         - VXI ECL0
IVISCOPE_VAL_ECL1         - VXI ECL1
IVISCOPE_VAL_PXI_STAR     - PXI Star
IVISCOPE_VAL_RTSI_0       - RTSI line 0
IVISCOPE_VAL_RTSI_1       - RTSI line 1
IVISCOPE_VAL_RTSI_2       - RTSI line 2
IVISCOPE_VAL_RTSI_3       - RTSI line 3
IVISCOPE_VAL_RTSI_4       - RTSI line 4
IVISCOPE_VAL_RTSI_5       - RTSI line 5
IVISCOPE_VAL_RTSI_6       - RTSI line 6

Notes:

(1) IVISCOPE_VAL_EXTERNAL - The oscilloscope waits for a trigger on the external trigger input.
   ]2-   �  �    Instrument Handle                ]�#����  �    Status                           e =z �  �    Runt High Threshold (volts)      e� = � �  �    Runt Low Threshold (volts)       f� �� �  �    Runt Polarity                    i� =  � �    Trigger Source                         	           4.0    1.0               hPositive IVISCOPE_VAL_RUNT_POSITIVE Negative IVISCOPE_VAL_RUNT_NEGATIVE Either IVISCOPE_VAL_RUNT_EITHER              iExternal IVISCOPE_VAL_EXTERNAL PXI TRIG0 or VXI TTL0 IVISCOPE_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVISCOPE_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVISCOPE_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVISCOPE_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVISCOPE_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVISCOPE_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVISCOPE_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVISCOPE_VAL_TTL7 ECL0 IVISCOPE_VAL_ECL0 ECL1 IVISCOPE_VAL_ECL1 PXI Star IVISCOPE_VAL_PXI_STAR RTSI 0 IVISCOPE_VAL_RTSI_0 RTSI 1 IVISCOPE_VAL_RTSI_1 RTSI 2 IVISCOPE_VAL_RTSI_2 RTSI 3 IVISCOPE_VAL_RTSI_3 RTSI 4 IVISCOPE_VAL_RTSI_4 RTSI 5 IVISCOPE_VAL_RTSI_5 RTSI 6 IVISCOPE_VAL_RTSI_6   =    This function configures the glitch trigger.  A glitch trigger occurs when the trigger signal has a pulse with a width that is less than the glitch width.  You specify the glitch width in the Glitch Width parameter.  You specify the polarity of the pulse with the Glitch Polarity parameter.  The trigger does not actually occur until the edge of a pulse that corresponds to the Glitch Width and Glitch Polarity crosses the threshold you specify in the Trigger Level parameter. 

Notes:

(1)  This function affects instrument behavior only if the trigger type is IVISCOPE_VAL_GLITCH_TRIGGER. Call the IviScope_ConfigureTrigger and IviScope_ConfigureTriggerCoupling functions to set the trigger type and trigger coupling before calling this function.

(2) This function is part of the IviScopeGlitchTrigger [GT] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    V    Pass the length of time you want the oscilloscope to use for the glitch width.  The driver sets the IVISCOPE_ATTR_GLITCH_WIDTH attribute to this value.

The oscilloscope triggers when it detects a pulse with a width less than or greater than this value, depending on the Glitch Condition parameter.

Units:  seconds

Default Value: 0.000010    �    Pass the voltage threshold you want the oscilloscope to use for glitch triggering.  The driver sets the IVISCOPE_ATTR_TRIGGER_LEVEL attribute to this value.

The oscilloscope triggers when a glitch crosses the trigger threshold you specify with this parameter.

Units:  volts

Default Value: 0.0

Notes:

(1) This parameter only affects instrument behavior when you select a channel or the external trigger input as the Trigger Source.  You cannot configure the trigger level that the oscilloscope uses for other trigger sources.  For example, if you select IVISCOPE_VAL_AC_LINE_TRIGGER as the trigger source, the oscilloscope triggers on zero crossings.    �    Pass the polarity of the glitch that you want to trigger the oscilloscope.  The driver sets the IVISCOPE_ATTR_GLITCH_POLARITY attribute to this value.

Defined Values:
- IVISCOPE_VAL_GLITCH_POSITIVE - The oscilloscope
  triggers on a positive glitch.

- IVISCOPE_VAL_GLITCH_NEGATIVE - The oscilloscope
  triggers on a negative glitch.

- IVISCOPE_VAL_GLITCH_EITHER - The oscilloscope
  triggers on either a positive or negative glitch.

Default Value:  IVISCOPE_VAL_GLITCH_POSITIVE


    �    Pass the source you want the oscilloscope to monitor for a trigger.  The driver sets the IVISCOPE_ATTR_TRIGGER_SOURCE attribute to this value. 

After you call one of the IviScope_ReadWaveform, IviScope_ReadMinMaxWaveform, IviScope_ReadWaveformMeasurement, or IviScope_InitiateAcquisition functions, the oscilloscope waits for the trigger from the source you specify in this parameter.

This control accepts one of the valid channel names or additional trigger sources listed below.  

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.


Defined Values:
(Additional Trigger Sources)

IVISCOPE_VAL_EXTERNAL     - External
IVISCOPE_VAL_TTL0         - PXI TRIG0 or VXI TTL0
IVISCOPE_VAL_TTL1         - PXI TRIG1 or VXI TTL1
IVISCOPE_VAL_TTL2         - PXI TRIG2 or VXI TTL2
IVISCOPE_VAL_TTL3         - PXI TRIG3 or VXI TTL3
IVISCOPE_VAL_TTL4         - PXI TRIG4 or VXI TTL4
IVISCOPE_VAL_TTL5         - PXI TRIG5 or VXI TTL5
IVISCOPE_VAL_TTL6         - PXI TRIG6 or VXI TTL6
IVISCOPE_VAL_TTL7         - PXI TRIG7 or VXI TTL7
IVISCOPE_VAL_ECL0         - VXI ECL0
IVISCOPE_VAL_ECL1         - VXI ECL1
IVISCOPE_VAL_PXI_STAR     - PXI Star
IVISCOPE_VAL_RTSI_0       - RTSI line 0
IVISCOPE_VAL_RTSI_1       - RTSI line 1
IVISCOPE_VAL_RTSI_2       - RTSI line 2
IVISCOPE_VAL_RTSI_3       - RTSI line 3
IVISCOPE_VAL_RTSI_4       - RTSI line 4
IVISCOPE_VAL_RTSI_5       - RTSI line 5
IVISCOPE_VAL_RTSI_6       - RTSI line 6

Notes:

(1) IVISCOPE_VAL_EXTERNAL - The oscilloscope waits for a trigger on the external trigger input.
        Pass the glitch condition. The driver uses this value to set the IVISCOPE_ATTR_GLITCH_CONDITION attribute.

The oscilloscope triggers when it detects a pulse with a width less than or greater than this value, depending on this parameter.

Defined Values:
- IVISCOPE_VAL_GLITCH_LESS_THAN - The oscilloscope triggers when
  the pulse width is less than the Glitch Width.

- IVISCOPE_VAL_GLITCH_GREATER_THAN - The oscilloscope triggers
  when the pulse width is greater than the Glitch Width.

Default Value:  IVISCOPE_VAL_GLITCH_LESS_THAN


   z(-   �  �    Instrument Handle                z�#����  �    Status                           � =z �  �    Glitch Width (seconds)           �b = � �  �    Trigger Level (volts)            �� � �  �    Glitch Polarity                  �� =  � �    Trigger Source                   �� �� �  �    Glitch Condition                       	           	0.000010    0.0               nPositive IVISCOPE_VAL_GLITCH_POSITIVE Negative IVISCOPE_VAL_GLITCH_NEGATIVE Either IVISCOPE_VAL_GLITCH_EITHER              iExternal IVISCOPE_VAL_EXTERNAL PXI TRIG0 or VXI TTL0 IVISCOPE_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVISCOPE_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVISCOPE_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVISCOPE_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVISCOPE_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVISCOPE_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVISCOPE_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVISCOPE_VAL_TTL7 ECL0 IVISCOPE_VAL_ECL0 ECL1 IVISCOPE_VAL_ECL1 PXI Star IVISCOPE_VAL_PXI_STAR RTSI 0 IVISCOPE_VAL_RTSI_0 RTSI 1 IVISCOPE_VAL_RTSI_1 RTSI 2 IVISCOPE_VAL_RTSI_2 RTSI 3 IVISCOPE_VAL_RTSI_3 RTSI 4 IVISCOPE_VAL_RTSI_4 RTSI 5 IVISCOPE_VAL_RTSI_5 RTSI 6 IVISCOPE_VAL_RTSI_6               VLess Than IVISCOPE_VAL_GLITCH_LESS_THAN Greater Than IVISCOPE_VAL_GLITCH_GREATER_THAN   G    This function configures the width trigger.  A width trigger occurs when the oscilloscope detects a positive or negative pulse with a width between, or optionally outside, the width thresholds.  You specify the width thresholds with the Width Low Threshold and Width High Threshold parameters.  You specify whether the oscilloscope triggers on pulse widths that are within or outside the width thresholds with the Width Condition parameter.  You specify the polarity of the pulse with the Width Polarity parameter.  The trigger does not actually occur until the edge of a pulse that corresponds to the Width Low Threshold, Width High Threshold, Width Condition, and Width Polarity crosses the threshold you specify in the Trigger Level parameter.

Notes:

(1) This function affects instrument behavior only if the trigger type is IVISCOPE_VAL_WIDTH_TRIGGER. Call the IviScope_ConfigureTrigger and IviScope_ConfigureTriggerCoupling functions to set the trigger type and trigger coupling before calling this function.

(2) This function is part of the IviScopeWidthTrigger [WT] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.

          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the voltage threshold you want the oscilloscope to use for width triggering.  The driver sets the IVISCOPE_ATTR_TRIGGER_LEVEL attribute to this value.

The oscilloscope triggers when the edge of a pulse that corresponds to the Width Low Threshold, Width High Threshold, Width Condition, and Width Polarity crosses the threshold you specify in this parameter.

Units:  volts

Default Value: 0.0

Notes:

(1) This parameter only affects instrument behavior when you select a channel or the external trigger input as the Trigger Source.  You cannot configure the trigger level that the oscilloscope uses for other trigger sources.  For example, if you select IVISCOPE_VAL_AC_LINE_TRIGGER as the trigger source, the oscilloscope triggers on zero crossings.    ,    Pass whether you want a pulse that is within or outside the Width High Threshold and Width Low Threshold to trigger the oscilloscope.

Defined Values:
- IVISCOPE_VAL_WIDTH_WITHIN - The oscilloscope
  triggers on pulses that have a width that is less than the
  Width High Threshold and greater than the Width Low Threshold.  
  
- IVISCOPE_VAL_WIDTH_OUTSIDE - The oscilloscope
  triggers on pulses that have a width that is either greater 
  than the Width High Threshold or less than a Width Low
  Threshold.

Default Value: IVISCOPE_VAL_WIDTH_WITHIN  
     �    Pass the low width threshold time.  The driver sets the IVISCOPE_ATTR_WIDTH_LOW_THRESHOLD to this value.

Units:  seconds

Default Value:  None

     �    Pass the high width threshold time.  The driver sets the IVISCOPE_ATTR_WIDTH_HIGH_THRESHOLD to this value.

Units:  seconds

Default Value:  None
    v    Pass the polarity of the pulse that you want to trigger the oscilloscope.  The driver sets the IVISCOPE_ATTR_WIDTH_POLARITY attribute to this value.

Defined Values:
- IVISCOPE_VAL_WIDTH_POSITIVE - The oscilloscope
  triggers on a positive pulse.

- IVISCOPE_VAL_WIDTH_NEGATIVE - The oscilloscope
  triggers on a negative pulse.

Default value: IVISCOPE_VAL_WIDTH_POSITIVE    �    Pass the source you want the oscilloscope to monitor for a trigger.  The driver sets the IVISCOPE_ATTR_TRIGGER_SOURCE attribute to this value. 

After you call one of the IviScope_ReadWaveform, IviScope_ReadMinMaxWaveform, IviScope_ReadWaveformMeasurement, or IviScope_InitiateAcquisition functions, the oscilloscope waits for the trigger from the source you specify in this parameter.

This control accepts one of the valid channel names or additional trigger sources listed below.  

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.


Defined Values:
(Additional Trigger Sources)

IVISCOPE_VAL_EXTERNAL     - External
IVISCOPE_VAL_TTL0         - PXI TRIG0 or VXI TTL0
IVISCOPE_VAL_TTL1         - PXI TRIG1 or VXI TTL1
IVISCOPE_VAL_TTL2         - PXI TRIG2 or VXI TTL2
IVISCOPE_VAL_TTL3         - PXI TRIG3 or VXI TTL3
IVISCOPE_VAL_TTL4         - PXI TRIG4 or VXI TTL4
IVISCOPE_VAL_TTL5         - PXI TRIG5 or VXI TTL5
IVISCOPE_VAL_TTL6         - PXI TRIG6 or VXI TTL6
IVISCOPE_VAL_TTL7         - PXI TRIG7 or VXI TTL7
IVISCOPE_VAL_ECL0         - VXI ECL0
IVISCOPE_VAL_ECL1         - VXI ECL1
IVISCOPE_VAL_PXI_STAR     - PXI Star
IVISCOPE_VAL_RTSI_0       - RTSI line 0
IVISCOPE_VAL_RTSI_1       - RTSI line 1
IVISCOPE_VAL_RTSI_2       - RTSI line 2
IVISCOPE_VAL_RTSI_3       - RTSI line 3
IVISCOPE_VAL_RTSI_4       - RTSI line 4
IVISCOPE_VAL_RTSI_5       - RTSI line 5
IVISCOPE_VAL_RTSI_6       - RTSI line 6

Notes:

(1) IVISCOPE_VAL_EXTERNAL - The oscilloscope waits for a trigger on the external trigger input.
   �-   �  �    Instrument Handle                ��#����  �    Status                           �� = � �  �    Trigger Level (volts)            �� �� �  �    Width Condition                  �% �  �  �    Width Low Threshold (seconds)    �� � � �  �    Width High Threshold (seconds)   �\ <� �  �    Width Polarity                   �� =  � �    Trigger Source                         	           0.0               DWithin IVISCOPE_VAL_WIDTH_WITHIN Outside IVISCOPE_VAL_WIDTH_OUTSIDE                       JPositive IVISCOPE_VAL_WIDTH_POSITIVE Negative IVISCOPE_VAL_WIDTH_NEGATIVE              iExternal IVISCOPE_VAL_EXTERNAL PXI TRIG0 or VXI TTL0 IVISCOPE_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVISCOPE_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVISCOPE_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVISCOPE_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVISCOPE_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVISCOPE_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVISCOPE_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVISCOPE_VAL_TTL7 ECL0 IVISCOPE_VAL_ECL0 ECL1 IVISCOPE_VAL_ECL1 PXI Star IVISCOPE_VAL_PXI_STAR RTSI 0 IVISCOPE_VAL_RTSI_0 RTSI 1 IVISCOPE_VAL_RTSI_1 RTSI 2 IVISCOPE_VAL_RTSI_2 RTSI 3 IVISCOPE_VAL_RTSI_3 RTSI 4 IVISCOPE_VAL_RTSI_4 RTSI 5 IVISCOPE_VAL_RTSI_5 RTSI 6 IVISCOPE_VAL_RTSI_6   ^    This function configures the slope of the AC Line trigger.

Notes:

(1) This function affects instrument behavior only if the trigger type is IVISCOPE_VAL_AC_LINE_TRIGGER. Call the IviScope_ConfigureTrigger function to set the trigger type before calling this function.

(2) This function is part of the IviScopeAcLineTrigger [AT] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Specify whether you want the oscilloscope to trigger on a zero crossing with a positive, negative, or either slope of the network supply voltage.  The driver uses this value to set the IVISCOPE_ATTR_AC_LINE_TRIGGER_SLOPE attribute.

Defined Values:
  IVISCOPE_VAL_AC_LINE_POSITIVE - Positive crossing
  IVISCOPE_VAL_AC_LINE_NEGATIVE - Negative crossing
  IVISCOPE_VAL_AC_LINE_EITHER   - Either crossing

Default value: IVISCOPE_VAL_AC_LINE_POSITIVE

   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� Q% �  �    Trigger Slope                          	                      qPositive IVISCOPE_VAL_AC_LINE_POSITIVE Negative IVISCOPE_VAL_AC_LINE_NEGATIVE Either IVISCOPE_VAL_AC_LINE_EITHER   6    This function configures the reference levels for waveform measurements.  

You must call this function before you call the IviScope_ReadWaveformMeasurement or IviScope_FetchWaveformMeasurement to take measurements.

Notes:

(1) This function is part of the IviScopeWaveformMeasurement [WM] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    %    Pass the low reference you want the oscilloscope to use for waveform measurements.  The driver sets the IVISCOPE_ATTR_MEAS_LOW_REF attribute to this value.

Units:  A percentage of the difference between the Voltage High and Voltage Low.

Default Value:  None

Notes:

(1) The oscilloscope calculates the Voltage High and the Voltage Low using either the min/max or histogram methods.  The min/max method uses the maximum and minimum values found.  The histogram method uses the most common values found above and below the middle of the waveform.    %    Pass the mid reference you want the oscilloscope to use for waveform measurements.  The driver sets the IVISCOPE_ATTR_MEAS_MID_REF attribute to this value.

Units:  A percentage of the difference between the Voltage High and Voltage Low.

Default Value:  None

Notes:

(1) The oscilloscope calculates the Voltage High and the Voltage Low using either the min/max or histogram methods.  The min/max method uses the maximum and minimum values found.  The histogram method uses the most common values found above and below the middle of the waveform.    '    Pass the high reference you want the oscilloscope to use for waveform measurements.  The driver sets the IVISCOPE_ATTR_MEAS_HIGH_REF attribute to this value.

Units:  A percentage of the difference between the Voltage High and Voltage Low.

Default Value:  None

Notes:

(1) The oscilloscope calculates the Voltage High and the Voltage Low using either the min/max or histogram methods.  The min/max method uses the maximum and minimum values found.  The histogram method uses the most common values found above and below the middle of the waveform.   �	-   �  �    Instrument Handle                ��#����  �    Status                           �� = % �  �    Low Ref (percentage)             � = � �  �    Mid Ref (percentage)             �? =u �  �    High Ref (percentage)                  	                      �    This function returns the actual number of points the oscilloscope acquires for each channel.  After you configure the oscilloscope for an acquisition, call this function to determine the size of the waveforms that the oscilloscope acquires.  The value is greater than or equal to the minimum number of points you specify in the IviScope_ConfigureAcquisitionRecord function.  

You must allocate a ViReal64 array of this size or greater to pass as the Waveform Array parameter of the IviScope_ReadWaveform and IviScope_FetchWaveform functions.

Notes:

(1) The oscilloscope may use records of different size depending on the acquisition type.  You specify the acquisition type with the IviScope_ConfigureAcquisitionType function.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    9    Returns the actual number of points the oscilloscope acquires for each channel.  The value is equal to or greater than the minimum number of points you specify in the IviScope_ConfigureAcquisitionRecord function.  

You must allocate a ViReal64 array of this size or greater to pass as the Waveform Array parameter of the IviScope_ReadWaveform and IviScope_FetchWaveform functions.

Notes:

(1) The oscilloscope may use records of different size depending on the acquisition type.  You specify the acquisition type with the IviScope_ConfigureAcquisitionType function.   �v-   �  �    Instrument Handle                �0#����  �    Status                           �R = � �  �    Actual Record Length                   	           	           �    The function returns the probe attenuation value the oscilloscope senses.  The automatic probe sense capability is enabled by setting the Probe Attenuation parameter of the IviScope_ConfigureChannel function to IVISCOPE_VAL_PROBE_SENSE_ON.

Notes:  

(1) If you disable the automatic probe sense capability, this parameter returns the manual probe attenuation setting.

(2) This function is part of the IviScopeProbeAutoSense [PAS] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Pass the virtual channel name that you assign to the instrument in the Configuration Utility for which you want to query the probe sense value.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Returns the probe attenuation value the oscilloscope senses.  The driver returns the value of the IVISCOPE_ATTR_PROBE_SENSE_VALUE attribute.

Notes:  

(1) If you disable the automatic probe sense capability, this parameter returns the manual probe attenuation setting.   �-   �  �    Instrument Handle                �� Q N �  �    Channel Name                     ��#����  �    Status                           � QD �  �    Auto Probe Sense Value                 ""    	           	           �    This function returns the sample mode the oscilloscope is currently using.

Notes:

(1) This function is part of the IviScopeSampleMode [SM] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    e    Returns the sample mode the oscilloscope is currently using.  The driver returns the value of the IVISCOPE_ATTR_SAMPLE_MODE attribute. 

Defined Values:
- IVISCOPE_VAL_REAL_TIME (0) - Indicates that the 
  oscilloscope is using real-time sampling.

- IVISCOPE_VAL_EQUIVALENT_TIME (1) - Indicates that
  the oscilloscope is using equivalent-time sampling.
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� = � �  �    Sample Mode                            	           	            �    This function returns the effective sample rate of the acquired waveform using the current configuration in samples per second.

     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Returns the effective sample rate of the acquired waveform the oscilloscope acquires for each channel.  The driver returns the value of the IVISCOPE_ATTR_HORZ_SAMPLE_RATE attribute. 

Units: samples per second   �X-   �  �    Instrument Handle                 #����  �    Status                           4 = � �  �    Sample Rate                            	           	          �    This function automatically configures the instrument.

Notes:

(1) When you call this function, the oscilloscope senses the input signal and automatically configures many of the instrument settings.  The settings no longer match the cache values for the corresponding attributes.  Therefore, this function invalidates all attribute cache values.

(2) This function is part of the IviScopeAutoSetup [AS] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   
y-   �  �    Instrument Handle                3#����  �    Status                                 	          �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
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
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   �-   �  �    Instrument Handle                w#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          !� = � � �    Attribute ID                     &� =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   1�-   �  �    Instrument Handle                2�#����  �    Status                           9� � � �  �    Attribute Value                 ���� � ���                                          ;� = � � �    Attribute ID                     A =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   K�-   �  �    Instrument Handle                L�#����  �    Status                           S� � � �  �    Attribute Value                 ���� � ���                                          U� = � � �    Attribute ID                     [9 =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   f-   �  �    Instrument Handle                f�#����  �    Status                           m� � � �  �    Attribute Value                 ���� � ���                                          p
 = � � �    Attribute ID                     uW =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    E    Pass the ID of an attribute.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �1-   �  �    Instrument Handle                ��#����  �    Status                           � � � �  �    Attribute Value                  �( =  �  �    Channel Name                     �w = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �J-   �  �    Instrument Handle                �#����  �    Status                           �& � � �  �    Attribute Value                  �� =  �  �    Channel Name                     �+ = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Channel Name                     �� = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the number of bytes in the value, pass a negative number for the Buffer Size parameter.

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviScope_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value:  512    �    Pass the ID of an attribute.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   ǲ-   �  �    Instrument Handle                �l#����  �    Status or Required Size          �L � L � �    Attribute Value                  �p =  �  �    Channel Name                     ٿ =� �  �    Buffer Size                      ܴ = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                �w#����  �    Status                           � � � �  �    Attribute Value                  �Q =  �  �    Channel Name                     � = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �n-   �  �    Instrument Handle                �(#����  �    Status                           J � � �  �    Attribute Value                   =  �  �    Channel Name                     Q = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
  all IVI attributes or only the attributes of the ViInt32 type.
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                G#����  �    Status                           i � � �  �    Attribute Value                  � =  �  �    Channel Name                    ���� � ���                                          � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   $)-   �  �    Instrument Handle                $�#����  �    Status                           , � � �  �    Attribute Value                  .5 =  �  �    Channel Name                    ���� � ���                                          2� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

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
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   9�-   �  �    Instrument Handle                :�#����  �    Status                           A� � � �  �    Attribute Value                  C� =  �  �    Channel Name                    ���� � ���                                          H" = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    E    Pass the ID of an attribute.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   Of-   �  �    Instrument Handle                P #����  �    Status                           WB � � �  �    Attribute Value                  Yr =  �  �    Channel Name                    ���� � ���                                          ]� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    E    Pass the ID of an attribute.

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
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   e-   �  �    Instrument Handle                e�#����  �    Status                           l� � � �  �    Attribute Value                  o =  �  �    Channel Name                    ���� � ���                                          sa = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0   
    This function initiates an acquisition on all channels that you enable with the IviScope_ConfigureChannel function.  If the channel you specify in the Channel Name parameter is not enabled for the acquisition, this function returns the IVISCOPE_ERROR_CHANNEL_NOT_ENABLED error.  It then waits for the acquisition to complete and returns the waveform for the channel you specify.  If the oscilloscope did not complete the acquisition within the time period you specify with the Maximum Time parameter, the function returns the IVISCOPE_ERROR_MAX_TIME_EXCEEDED error.

You call the IviScope_FetchWaveform function to obtain the waveforms for each of the remaining enabled channels without initiating another acquisition.

Notes:

(1) Use this function to read waveforms when you set the acquisition mode to IVISCOPE_VAL_NORMAL, IVISCOPE_VAL_HI_RES, or IVISCOPE_VAL_AVERAGE.  If the acquisition type is not one of the listed types, the function returns the IVISCOPE_ERROR_INVALID_ACQ_TYPE error.

(2) After this function executes, each element in the Waveform Array parameter is either a voltage or a value indicating that the oscilloscope could not sample a voltage.

(3) You configure the interpolation method the oscilloscope uses
with the IviScope_ConfigureInterpolation function.  If you
disable interpolation, the oscilloscope does not interpolate
points in the waveform.  If the oscilloscope cannot sample a
value for a point in the waveform, the driver sets the
corresponding element in the Waveform Array to an IEEE defined
NaN (Not a Number) value and the function returns
IVISCOPE_WARN_INVALID_WFM_ELEMENT.

(4) You can test a waveform value for an invalid value condition
by calling the IviScope_IsInvalidWfmElement function.

(5) This function performs interchangeability checking when the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If
the IVISCOPE_ATTR_SPY attribute is set to VI_TRUE, you use the
NI I/O Trace utility to view interchangeability warnings.  You use the
IviScope_GetNextInterchangeWarning function to retrieve
interchangeability warnings when the IVISCOPE_ATTR_SPY attribute
is set to VI_FALSE.  For more information about
interchangeability checking, refer to the help text for the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute.

(6) The class driver returns a simulated waveform when this
function is called and the IVISCOPE_ATTR_SIMULATE attribute is set to VI_TRUE and the IVISCOPE_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated waveform, refer to the online help manual.
        Pass the virtual channel name that you assign to the instrument in the Configuration Utility from which you want to read a waveform.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     U    Pass the number of elements in the Waveform Array parameter.

Default Value: None

    �    Pass the maximum length of time in which to allow the read waveform operation to complete.    

If the operation does not complete within this time interval, the function returns the IVISCOPE_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call IviScope_Abort to cancel the read waveform operation and return the oscilloscope to the Idle state.

Units:  milliseconds  

Defined Values:
IVISCOPE_VAL_MAX_TIME_INFINITE             IVISCOPE_VAL_MAX_TIME_IMMEDIATE           

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters or attributes.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    <    Returns the waveform that the oscilloscope acquires.  

Units:  volts

Notes:

(1) The IviScope_ActualRecordLength function returns the number of points the oscilloscope acquires for each channel.  Pass a ViReal64 array with at least this many elements.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.
     V    Indicates the number of points the function places in the Waveform Array parameter.
    �    Indicates the time of the first point in the Waveform Array.  The time is relative to the trigger event.  

For example, if the oscilloscope acquires the first point in the Waveform Array 1 second before the trigger, this parameter returns the value -1.0.  If the acquisition of the first point occurs at the same time as the trigger, this parameter returns the value 0.0.

Units:  seconds     W    Indicates the length of time between points in the Waveform Array.  

Units:  seconds   �e =   �  �    Channel Name                     �z = � �  �    Waveform Size                    �� =| �  �    Maximum Time (ms)                �f-   �  �    Instrument Handle                � #����  �    Status                           �B � d �  �    Waveform Array                   �� �: �  �    Actual Points                    �� � d �  �    Initial X                        �s �: �  �    X Increment                        ""        5000        	           	            	            	           	          
�    This function initiates an acquisition on all channels that you enable with the IviScope_ConfigureChannel function.  If the channel you specify in the Channel Name parameter is not enabled for the acquisition, this function returns the IVISCOPE_ERROR_CHANNEL_NOT_ENABLED error.  It then waits for the acquisition to complete and returns the min/max waveforms for the channel you specify.  If the oscilloscope did not complete the acquisition within the time period you specify with the Maximum Time parameter, the function returns the IVISCOPE_ERROR_MAX_TIME_EXCEEDED error.

You call the IviScope_FetchMinMaxWaveform function to obtain the waveforms for each of the remaining enabled channels without initiating another acquisition.

Notes:

(1) Use this function to read waveforms when you set the acquisition type to IVISCOPE_VAL_PEAK_DETECT or IVISCOPE_VAL_ENVELOPE.  If the acquisition type is not one of the listed types, the function returns the IVISCOPE_ERROR_INVALID_ACQ_TYPE error.

(2) After this function executes, each element in the Min Waveform Array and Max Waveform Array parameters is either a voltage or a value indicating that the oscilloscope could not sample a voltage.

(3) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(4) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.

(5) This function performs interchangeability checking when the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If
the IVISCOPE_ATTR_SPY attribute is set to VI_TRUE, you use the
NI I/O Trace utility to view interchangeability warnings.  You use the
IviScope_GetNextInterchangeWarning function to retrieve
interchangeability warnings when the IVISCOPE_ATTR_SPY attribute
is set to VI_FALSE.  For more information about
interchangeability checking, refer to the help text for the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute.

(6) The class driver returns simulated minimum and maximum waveforms when this function is called and the IVISCOPE_ATTR_SIMULATE attribute is set to VI_TRUE and the IVISCOPE_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated waveform, refer to the online help manual.

(7) This function is part of the IviScopeMinMaxWaveform [MmW] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    #    Pass the virtual channel name that you assign to the instrument in the Configuration Utility from which you want to read the minimum and maximum waveforms.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.     q    Pass the number of elements in the Min Waveform Array and Max Waveform Array parameters.

Default Value: None

    �    Pass the maximum length of time in which to allow the read waveform operation to complete.  

If the operation does not complete within this time interval, the function returns the IVISCOPE_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call IviScope_Abort to cancel the read waveform operation and return the oscilloscope to the Idle state.

Units:  milliseconds

Defined Values:
IVISCOPE_VAL_MAX_TIME_INFINITE             IVISCOPE_VAL_MAX_TIME_IMMEDIATE           

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters or attributes.
    B    Returns the minimum waveform that the oscilloscope acquires.

Units: volts

Notes:

(1) The IviScope_ActualRecordLength function returns the number of points the oscilloscope acquires for each channel.  Pass a ViReal64 array with at least this many elements.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.

    C    Returns the maximum waveform that the oscilloscope acquires.  

Units: volts

Notes:

(1) The IviScope_ActualRecordLength function returns the number of points the oscilloscope acquires for each channel.  Pass a ViReal64 array with at least this many elements.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.
     r    Indicates the number of points the function places in the Min Waveform Array and Max Waveform Array parameters.
    �    Indicates the time of the first point in the Min Waveform Array and Max Waveform Array.  The time is relative to the trigger event.  

Units:  seconds  

For example, if the oscilloscope acquires the first point in the waveforms 1 second before the trigger, this parameter returns the value -1.0.  If the acquisition of the first point occurs at the same time as the trigger, this parameter returns the value 0.0.     b    Indicates the length of time between points in the Min and Max Waveform Arrays.

Units:  seconds   ��-   �  �    Instrument Handle                �W#����  �    Status                           �y =   �  �    Channel Name                     �� = � �  �    Waveform Size                    � =| �  �    Maximum Time (ms)                �� �   �  �    Min Waveform Array               �� � � �  �    Max Waveform Array               �= �| �  �    Actual Points                    �� � d �  �    Initial X                        �^ �: �  �    X Increment                            	           ""        5000    	            	            	            	           	          �    This function initiates an acquisition on all channels that you enable with the IviScope_ConfigureChannel function.  If the channel you specify in the Channel Name parameter is not enabled for the acquisition, this function returns the IVISCOPE_ERROR_CHANNEL_NOT_ENABLED error.  It then waits for the acquisition to complete and returns the waveform measurement for the channel you specify.  If the oscilloscope did not complete the acquisition within the time period you specify with the Maximum Time parameter, the function returns the IVISCOPE_ERROR_MAX_TIME_EXCEEDED error.

You call the IviScope_FetchWaveformMeasurement function to obtain any other waveform measurement on a specific channel without initiating another acquisition.

Notes:

(1) You must configure the appropriate reference levels before you call this function.  You configure the low, mid, and high references either by calling the IviScope_ConfigureRefLevels function or by setting the following attributes:

  IVISCOPE_ATTR_MEAS_HIGH_REF
  IVISCOPE_ATTR_MEAS_LOW_REF
  IVISCOPE_ATTR_MEAS_MID_REF

(2) This function performs interchangeability checking when the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If
the IVISCOPE_ATTR_SPY attribute is set to VI_TRUE, you use the
NI I/O Trace utility to view interchangeability warnings.  You use the
IviScope_GetNextInterchangeWarning function to retrieve
interchangeability warnings when the IVISCOPE_ATTR_SPY attribute
is set to VI_FALSE.  For more information about
interchangeability checking, refer to the help text for the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute.

(3) The class driver returns a simulated measurement when this
function is called and the IVISCOPE_ATTR_SIMULATE attribute is set to VI_TRUE and the IVISCOPE_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.

(4) This function is part of the IviScopeWaveformMeasurement [WM] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the virtual channel name that you assign to the instrument in the Configuration Utility from which you want to read a waveform measurement.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.    �    Pass the maximum length of time in which to allow the read waveform measurement operation to complete.    

If the operation does not complete within this time interval, the function returns the IVISCOPE_ERROR_MAX_TIME_EXCEEDED error code.  When this occurs, you can call IviScope_Abort to cancel the read waveform operation and return the oscilloscope to the Idle state.

Units:  milliseconds.  

Defined Values:
IVISCOPE_VAL_MAX_TIME_INFINITE             IVISCOPE_VAL_MAX_TIME_IMMEDIATE           

Default Value: 5000 (ms)

Notes:

(1) The Maximum Time parameter applies only to this function.  It has no effect on other timeout parameters or attributes.
        Returns the measured value.  

Units:  The units depend on the Measurement Function you select as shown below:

    Rise Time            - seconds
    Fall Time            - seconds
    Frequency            - hertz
    Period               - seconds
    Voltage RMS          - volts
    Voltage RMS (Cycle)  - volts
    Voltage Max          - volts
    Voltage Min          - volts
    Voltage Vpp          - volts
    Voltage High         - volts
    Voltage Low          - volts
    Voltage Avg.         - volts
    Voltage Avg. (Cycle) - volts
    Width Negative       - seconds
    Width Positive       - seconds
    Duty Cycle Negative  - percent
    Duty Cycle Positive  - percent
    Amplitude            - volts
    Overshoot            - percent
    Preshoot             - percent
    �    Pass the waveform measurement you want the oscilloscope to perform.

Defined Values:

- IVISCOPE_VAL_RISE_TIME - Rise Time
  The length of time for the first rising edge of the signal to
  rise from the low reference level to the high reference level.

- IVISCOPE_VAL_FALL_TIME - Fall Time
  The length of time for the first falling edge of the signal to
  fall from the high reference level to the low reference level.

- IVISCOPE_VAL_FREQUENCY - Frequency
  The frequency of one complete cycle in the waveform.

- IVISCOPE_VAL_PERIOD - Period
  The length of time of one complete cycle in the waveform.

- IVISCOPE_VAL_VOLTAGE_RMS - Voltage RMS
  The true Root Mean Square voltage of the entire waveform.

- IVISCOPE_VAL_VOLTAGE_CYCLE_RMS - Voltage RMS (Cycle)
  The true Root Mean Square voltage over the first cycle in the
  waveform.

- IVISCOPE_VAL_VOLTAGE_MIN - Voltage Min
  The minimum amplitude found in the entire waveform.

- IVISCOPE_VAL_VOLTAGE_MAX - Voltage Max
  The maximum amplitude found in the entire waveform.

- IVISCOPE_VAL_VOLTAGE_PEAK_TO_PEAK - Voltage Vpp
  The absolute difference between the Voltage Max and the
  Voltage Min.

- IVISCOPE_VAL_VOLTAGE_LOW - Voltage Low 
  The voltage that corresponds to 0% when you use the reference
  levels.  The oscilloscope calculates this value using either
  the min/max or histogram methods.  The min/max method uses the
  minimum value found.  The histogram method uses the most
  common value found below the middle of the waveform.

- IVISCOPE_VAL_VOLTAGE_HIGH - Voltage High
  The voltage that corresponds to 100% when you use the
  reference levels.  The oscilloscope calculates this value
  using either the min/max or histogram methods.  The min/max
  method uses the maximum value found.  The histogram method
  uses the most common value found above the middle of the
  waveform.

- IVISCOPE_VAL_VOLTAGE_AVERAGE - Voltage Avg.
  The arithmetic average amplitude of the entire waveform.

- IVISCOPE_VAL_VOLTAGE_CYCLE_AVERAGE - Voltage Avg. (Cycle)
  The arithmetic average amplitude of the first cycle in the
  waveform.

- IVISCOPE_VAL_WIDTH_NEG - Width Negative
  The length of time between the mid reference level points of
  the first negative pulse in the waveform.

- IVISCOPE_VAL_WIDTH_POS - Width Positive
  The length of time between the mid reference level points of
  the first positive pulse in the waveform.

- IVISCOPE_VAL_DUTY_CYCLE_NEG - Duty Cycle Negative
  The ratio of the Width Negative to the Period of the first
  cycle in the waveform expressed as a percentage.

  Duty Cycle Negative = 100.0 x (Width Negative)/Period

- IVISCOPE_VAL_DUTY_CYCLE_POS - Duty Cycle Positive
  The ratio of the Width Positive to the Period of the first
  cycle in the waveform expressed as a percentage.

  Duty Cycle Positive = 100.0 X (Width Positive)/Period

- IVISCOPE_VAL_AMPLITUDE - Amplitude
  The Voltage High less the Voltage Low in Volts over the entire
  waveform.

- IVISCOPE_VAL_OVERSHOOT - Overshoot
  The relative waveform distortion which follows an edge
  transition.  It is calculated using the following formula:
  - for the rising edge:

    OVERSHOOT = ((local maximum - Voltage High)/Amplitude)*100%

      where the local maximum is the maximum voltage of the
      signal in the first half of the time period that commences
      when the rising edge crosses the high reference level and
      concludes when the subsequent falling edge crosses the
      high reference level.

  - for the falling edge:  

    OVERSHOOT = ((Voltage Low - local minimum)/Amplitude)*100%

      where the local minimum is the minimum value of the signal
      measured in the first half of the time period that
      commences when the falling edge crosses the low reference
      level and concludes when the subsequent rising edge
      crosses the low reference level.

  The instrument makes the measurement on the edge closest to
  the beginning of the waveform record.

- IVISCOPE_VAL_PRESHOOT - Preshoot
  The relative waveform distortion which precedes an edge
  transition. It is calculated using the following formula:
  - for the rising edge

    PRESHOOT = ((Voltage Low - local minimum)/Amplitude)*100%

      where the local minimum is the minimum value of the signal
      measured in the second half of the time period that
      commences when the preceding falling edge crosses the low
      reference level and concludes when the rising edge crosses
      the low reference level.

  - for the falling edge:  

    PRESHOOT = ((local maximum - Voltage High)/Amplitude)*100%

      where the local maximum is the maximum voltage of the
      signal in the second half of the time period that
      commences when the preceding rising edge crosses the high
      reference level and concludes when the falling edge
      crosses the high reference level.

  The instrument makes the measurement on the edge closest to
  the beginning of the waveform record.

Default Value:  IVISCOPE_VAL_RISE_TIME  

Notes:

(1) You must configure the appropriate reference levels before you call this function.  You configure the low, mid, and high references either by calling the IviScope_ConfigureRefLevels function or by setting the following attributes:

  IVISCOPE_ATTR_MEAS_HIGH_REF
  IVISCOPE_ATTR_MEAS_LOW_REF
  IVISCOPE_ATTR_MEAS_MID_REF
   �-   �  �    Instrument Handle                ��#����  �    Status                           �� =   �  �    Channel Name                     � =| �  �    Maximum Time (ms)                ֮ � � �  �    Measurement                      �� = � � �    Measurement Function                   	           ""    5000    	                     Rise Time IVISCOPE_VAL_RISE_TIME Fall Time IVISCOPE_VAL_FALL_TIME Frequency IVISCOPE_VAL_FREQUENCY Period IVISCOPE_VAL_PERIOD Voltage RMS IVISCOPE_VAL_VOLTAGE_RMS Voltage RMS (cycle) IVISCOPE_VAL_VOLTAGE_CYCLE_RMS Voltage Min IVISCOPE_VAL_VOLTAGE_MIN Voltage Max IVISCOPE_VAL_VOLTAGE_MAX Voltage Vpp IVISCOPE_VAL_VOLTAGE_PEAK_TO_PEAK Voltage Low IVISCOPE_VAL_VOLTAGE_LOW Voltage High IVISCOPE_VAL_VOLTAGE_HIGH Voltage Average IVISCOPE_VAL_VOLTAGE_AVERAGE Voltage Average (cycle) IVISCOPE_VAL_VOLTAGE_CYCLE_AVERAGE Width Negative IVISCOPE_VAL_WIDTH_NEG Width Positive IVISCOPE_VAL_WIDTH_POS Duty Cycle Negative IVISCOPE_VAL_DUTY_CYCLE_NEG Duty Cycle Positive IVISCOPE_VAL_DUTY_CYCLE_POS Amplitude IVISCOPE_VAL_AMPLITUDE Overshoot IVISCOPE_VAL_OVERSHOOT Preshoot IVISCOPE_VAL_PRESHOOT       This function initiates a waveform acquisition.  After you call this function, the oscilloscope leaves the Idle state and waits for a trigger.  The oscilloscope acquires a waveform for each channel you have enabled with the  IviScope_ConfigureChannel function.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviScope_error_query function at the conclusion of the sequence.

(2) This function performs interchangeability checking when the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  If
the IVISCOPE_ATTR_SPY attribute is set to VI_TRUE, you use the
NI I/O Trace utility to view interchangeability warnings.  You use the
IviScope_GetNextInterchangeWarning function to retrieve
interchangeability warnings when the IVISCOPE_ATTR_SPY attribute
is set to VI_FALSE.  For more information about
interchangeability checking, refer to the help text for the
IVISCOPE_ATTR_INTERCHANGE_CHECK attribute.

(3) The class driver performs a simulated waveform acquisition when this function is called and the IVISCOPE_ATTR_SIMULATE attribute is set to VI_TRUE and the IVISCOPE_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated waveform, refer to the online help manual.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �F-   �  �    Instrument Handle                � #����  �    Status                                 	          �    This function returns whether an acquisition is in progress, complete, or if the status is unknown.

Notes:

(1) This function does not check the instrument error status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviScope_error_query function at the conclusion of the sequence.

(2) If the instrument cannot return its acquisition status, this function returns the IVISCOPE_VAL_ACQ_STATUS_UNKNOWN value.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    n    Returns the acquisition status of the oscilloscope.  Possible values that this parameter returns are:

- IVISCOPE_VAL_ACQ_IN_PROGRESS (0) - The oscilloscope 
  is currently acquiring a waveform.

- IVISCOPE_VAL_ACQ_COMPLETE (1) - The acquisition
  is complete.

- IVISCOPE_VAL_ACQ_STATUS_UNKNOWN (-1) - The 
  driver cannot determine the status of the acquisition.   5-   �  �    Instrument Handle                �#����  �    Status                            = � �  �    Acquisition Status                     	           	           	    This function returns the waveform the oscilloscope acquires for the channel you specify.  The waveform is from an acquisition that you initiate prior to calling this function.

You use the IviScope_InitiateAcquisition function to start an acquisition on the channels that you enable with the IviScope_ConfigureChannel function.  The oscilloscope acquires waveforms for the enabled channels concurrently.  You use the IviScope_AcquisitionStatus function to determine when the acquisition is complete.  You must call this function separately for each enabled channel to obtain the waveforms.

You can call the IviScope_ReadWaveform function instead of the IviScope_InitiateAcquisition function.  The IviScope_ReadWaveform function starts an acquisition on all enabled channels, waits for the acquisition to complete, and returns the waveform for the channel you specify.  You call this function to obtain the waveforms for each of the remaining channels.

Notes:

(1) After this function executes, each element in the Waveform Array parameter is either a voltage or a value indicating that the oscilloscope could not sample a voltage.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.

(4) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviScope_error_query function at the conclusion of the sequence.

(5) The class driver returns a simulated waveform when this
function is called and the IVISCOPE_ATTR_SIMULATE attribute is set to VI_TRUE and the IVISCOPE_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated waveform, refer to the online help manual.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the virtual channel name that you assign to the instrument in the Configuration Utility from which you want to fetch a waveform.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     U    Pass the number of elements in the Waveform Array parameter.

Default Value: None

    <    Returns the waveform that the oscilloscope acquires.  

Units:  volts

Notes:

(1) The IviScope_ActualRecordLength function returns the number of points the oscilloscope acquires for each channel.  Pass a ViReal64 array with at least this many elements.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.
     V    Indicates the number of points the function places in the Waveform Array parameter.
    �    Indicates the time of the first point in the Waveform Array.  The time is relative to the trigger event.  

For example, if the oscilloscope acquires the first point in the Waveform Array 1 second before the trigger, this parameter returns the value -1.0.  If the acquisition of the first point occurs at the same time as the trigger, this parameter returns the value 0.0.

Units:  seconds  
     W    Indicates the length of time between points in the Waveform Array.  

Units:  seconds   �-   �  �    Instrument Handle                �#����  �    Status                           � =  �  �    Channel Name                     #� = � �  �    Waveform Size                    $ = �  �    Waveform Array                   '\ �  �  �    Actual Points                    '� � � �  �    Initial X                        )L � �  �    X Increment                            	           ""        	            	            	           	          �    This function returns the minimum and maximum waveforms that the oscilloscope acquires for the channel you specify.  If the channel is not enabled for the acquisition, this function returns IVISCOPE_ERROR_CHANNEL_NOT_ENABLED error.

The waveforms are from an acquisition that you previously initiated.  Use this function to fetch waveforms when you set the acquisition type to IVISCOPE_VAL_PEAK_DETECT or IVISCOPE_VAL_ENVELOPE.  If the acquisition type is not one of the listed types, the function returns the IVISCOPE_ERROR_INVALID_ACQ_TYPE error.

Use the IviScope_InitiateAcquisition function to start an acquisition on the channels that you enable with the IviScope_ConfigureChannel function.  The oscilloscope acquires the min/max waveforms for the enabled channels concurrently. You use the IviScope_AcquisitionStatus function to determine when the acquisition is complete.  You must call this function separately for each enabled channel to obtain the min/max waveforms.

You can call the IviScope_ReadMinMaxWaveform function instead of the IviScope_InitiateAcquisition function.  The IviScope_ReadMinMaxWaveform function starts an acquisition on all enabled channels, waits for the acquisition to complete, and returns the min/max waveforms for the channel you specify.  You call this function to obtain the min/max waveforms for each of the remaining channels.

Notes:

(1) After this function executes, each element in the Min Waveform Array and Max Waveform Array parameters is either a voltage or a value indicating that the oscilloscope could not sample a voltage.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.

(4) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviScope_error_query function at the conclusion of the sequence.

(5) The class driver returns a simulated minimum and maximum waveform when this function is called and the IVISCOPE_ATTR_SIMULATE attribute is set to VI_TRUE and the IVISCOPE_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated waveform, refer to the online help manual.

(6) This function is part of the IviScopeMinMaxWaveform [MmW] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    $    Pass the virtual channel name that you assign to the instrument in the Configuration Utility from which you want to fetch the minimum and maximum waveforms.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.     q    Pass the number of elements in the Min Waveform Array and Max Waveform Array parameters.

Default Value: None

    B    Returns the minimum waveform that the oscilloscope acquires.

Units:  volts

Notes:

(1) The IviScope_ActualRecordLength function returns the number of points the oscilloscope acquires for each channel.  Pass a ViReal64 array with at least this many elements.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.
    D    Returns the maximum waveform that the oscilloscope acquires.  

Units:  volts

Notes:

(1) The IviScope_ActualRecordLength function returns the number of points the oscilloscope acquires for each channel.  Pass a ViReal64 array with at least this many elements.

(2) You configure the interpolation method the oscilloscope uses with the IviScope_ConfigureInterpolation function.  If you disable interpolation, the oscilloscope does not interpolate points in the waveform.  If the oscilloscope cannot sample a value for a point in the waveform, the driver sets the corresponding element in the Waveform Array to an IEEE defined NaN (Not a Number) value and the function returns IVISCOPE_WARN_INVALID_WFM_ELEMENT.  

(3) You can test a waveform value for an invalid value condition by calling the IviScope_IsInvalidWfmElement function.
     r    Indicates the number of points the function places in the Min Waveform Array and Max Waveform Array parameters.
    �    Indicates the time of the first point in the Min Waveform Array and Max Waveform Array.  The time is relative to the trigger event.  

For example, if the oscilloscope acquires the first point in the waveforms 1 second before the trigger, this parameter returns the value -1.0.  If the acquisition of the first point occurs at the same time as the trigger, this parameter returns the value 0.0.

Units:  seconds  
     r    Indicates the length of time between points in the Min Waveform Array and Max Waveform Array.  

Units:  seconds   7D-   �  �    Instrument Handle                7�#����  �    Status                           ?  =  �  �    Channel Name                     CL = � �  �    Waveform Size                    C� = �  �    Min Waveform Array               G � S �  �    Max Waveform Array               J[ �D �  �    Actual Points                    J� � S �  �    Initial X                        L} �D �  �    X Increment                            	           ""        	            	            	            	           	          	:    This function fetches a waveform measurement from the channel you specify.  If the channel is not enabled for the acquisition, this function returns IVISCOPE_ERROR_CHANNEL_NOT_ENABLED error.
The waveform on which the oscilloscope calculates the waveform measurement is from an acquisition that you previously initiated.

Use the IviScope_InitiateAcquisition function to start an acquisition on the channels that you enable with the IviScope_ConfigureChannel function.  The oscilloscope acquires waveforms for the enabled channels concurrently.  You use the IviScope_AcquisitionStatus function to determine when the acquisition is complete.  You call this function separately for each waveform measurement you want to obtain on a specific channel.

You can call the IviScope_ReadWaveformMeasurement function instead of the IviScope_InitiateAcquisition function.  The IviScope_ReadWaveformMeasurement function starts an acquisition on all enabled channels.  It then waits for the acquisition to complete, obtains a waveform measurement on the channel you specify, and returns the measurement value.  You call this function separately for any other waveform measurement that you want to obtain on a specific channel.

Notes:

(1) You must configure the appropriate reference levels before you call this function.  You configure the low, mid, and high references either by calling the IviScope_ConfigureRefLevels function or by setting the following attributes.

  IVISCOPE_ATTR_MEAS_HIGH_REF
  IVISCOPE_ATTR_MEAS_LOW_REF
  IVISCOPE_ATTR_MEAS_MID_REF

(2) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviScope_error_query function at the conclusion of the sequence.

(3) The class driver returns a simulated measurement when this
function is called and the IVISCOPE_ATTR_SIMULATE attribute is set to VI_TRUE and the IVISCOPE_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.

(4) This function is part of the IviScopeWaveformMeasurement [WM] extension group.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the virtual channel name that you assign to the instrument in the Configuration Utility from which you want to fetch a waveform measurement.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.    �    Pass the waveform measurement you want the oscilloscope to perform.

Defined Values:

- IVISCOPE_VAL_RISE_TIME - Rise Time
  The length of time for the first rising edge of the signal to
  rise from the low reference level to the high reference level.

- IVISCOPE_VAL_FALL_TIME - Fall Time
  The length of time for the first falling edge of the signal to
  fall from the high reference level to the low reference level.

- IVISCOPE_VAL_FREQUENCY - Frequency
  The frequency of one complete cycle in the waveform.

- IVISCOPE_VAL_PERIOD - Period
  The length of time of one complete cycle in the waveform.

- IVISCOPE_VAL_VOLTAGE_RMS - Voltage RMS
  The true Root Mean Square voltage of the entire waveform.

- IVISCOPE_VAL_VOLTAGE_CYCLE_RMS - Voltage RMS (Cycle)
  The true Root Mean Square voltage over the first cycle in the
  waveform.

- IVISCOPE_VAL_VOLTAGE_MIN - Voltage Min
  The minimum amplitude found in the entire waveform.

- IVISCOPE_VAL_VOLTAGE_MAX - Voltage Max
  The maximum amplitude found in the entire waveform.

- IVISCOPE_VAL_VOLTAGE_PEAK_TO_PEAK - Voltage Vpp
  The absolute difference between the Voltage Max and the
  Voltage Min.

- IVISCOPE_VAL_VOLTAGE_LOW - Voltage Low 
  The voltage that corresponds to 0% when you use the reference
  levels.  The oscilloscope calculates this value using either
  the min/max or histogram methods.  The min/max method uses the
  minimum value found.  The histogram method uses the most
  common value found below the middle of the waveform.

- IVISCOPE_VAL_VOLTAGE_HIGH - Voltage High
  The voltage that corresponds to 100% when you use the
  reference levels.  The oscilloscope calculates this value
  using either the min/max or histogram methods.  The min/max
  method uses the maximum value found.  The histogram method
  uses the most common value found above the middle of the
  waveform.

- IVISCOPE_VAL_VOLTAGE_AVERAGE - Voltage Avg.
  The arithmetic average amplitude of the entire waveform.

- IVISCOPE_VAL_VOLTAGE_CYCLE_AVERAGE - Voltage Avg. (Cycle)
  The arithmetic average amplitude of the first cycle in the
  waveform.

- IVISCOPE_VAL_WIDTH_NEG - Width Negative
  The length of time between the mid reference level points of
  the first negative pulse in the waveform.

- IVISCOPE_VAL_WIDTH_POS - Width Positive
  The length of time between the mid reference level points of
  the first positive pulse in the waveform.

- IVISCOPE_VAL_DUTY_CYCLE_NEG - Duty Cycle Negative
  The ratio of the Width Negative to the Period of the first
  cycle in the waveform expressed as a percentage.

  Duty Cycle Negative = 100.0 x (Width Negative)/Period

- IVISCOPE_VAL_DUTY_CYCLE_POS - Duty Cycle Positive
  The ratio of the Width Positive to the Period of the first
  cycle in the waveform expressed as a percentage.

  Duty Cycle Positive = 100.0 X (Width Positive)/Period

- IVISCOPE_VAL_AMPLITUDE - Amplitude
  The Voltage High less the Voltage Low in Volts over the entire
  waveform

- IVISCOPE_VAL_OVERSHOOT - Overshoot
  The relative waveform distortion which follows an edge
  transition.  It is calculated using the following formula:
  - for the rising edge:

    OVERSHOOT = ((local maximum - Voltage High)/Amplitude)*100%

      where the local maximum is the maximum voltage of the
      signal in the first half of the time period that commences
      when the rising edge crosses the high reference level and
      concludes when the subsequent falling edge crosses the
      high reference level.

  - for the falling edge:  

    OVERSHOOT = ((Voltage Low - local minimum)/Amplitude)*100%

      where the local minimum is the minimum value of the signal
      measured in the first half of the time period that
      commences when the falling edge crosses the low reference
      level and concludes when the subsequent rising edge
      crosses the low reference level.

  The instrument makes the measurement on the edge closest to
  the beginning of the waveform record.

- IVISCOPE_VAL_PRESHOOT - Preshoot
  The relative waveform distortion which precedes an edge
  transition. It is calculated using the following formula:
  - for the rising edge

    PRESHOOT = ((Voltage Low - local minimum)/Amplitude)*100%

      where the local minimum is the minimum value of the signal
      measured in the second half of the time period that
      commences when the preceding falling edge crosses the low
      reference level and concludes when the rising edge crosses
      the low reference level.

  - for the falling edge:  

    PRESHOOT = ((local maximum - Voltage High)/Amplitude)*100%

      where the local maximum is the maximum voltage of the
      signal in the second half of the time period that
      commences when the preceding rising edge crosses the high
      reference level and concludes when the falling edge
      crosses the high reference level.

  The instrument makes the measurement on the edge closest to
  the beginning of the waveform record.

Default Value:  IVISCOPE_VAL_RISE_TIME  

Notes:

(1) You must configure the appropriate reference levels before you call this function.  You configure the low, mid, and high references either by calling the IviScope_ConfigureRefLevels function or by setting the following attributes.

  IVISCOPE_ATTR_MEAS_HIGH_REF
  IVISCOPE_ATTR_MEAS_LOW_REF
  IVISCOPE_ATTR_MEAS_MID_REF
        Returns the measured value.  

Units:  The units depend on the Measurement Function you select as shown below.

    Rise Time            - seconds
    Fall Time            - seconds
    Frequency            - hertz
    Period               - seconds
    Voltage RMS          - volts
    Voltage RMS (Cycle)  - volts
    Voltage Max          - volts
    Voltage Min          - volts
    Voltage Vpp          - volts
    Voltage High         - volts
    Voltage Low          - volts
    Voltage Avg.         - volts
    Voltage Avg. (Cycle) - volts
    Width Negative       - seconds
    Width Positive       - seconds
    Duty Cycle Negative  - percent
    Duty Cycle Positive  - percent
    Amplitude            - volts
    Overshoot            - percent
    Preshoot             - percent


   Xl-   �  �    Instrument Handle                Y&#����  �    Status                           `H = - �  �    Channel Name                     di =n � �    Measurement Function             yK � � �  �    Measurement                            	           ""              Rise Time IVISCOPE_VAL_RISE_TIME Fall Time IVISCOPE_VAL_FALL_TIME Frequency IVISCOPE_VAL_FREQUENCY Period IVISCOPE_VAL_PERIOD Voltage RMS IVISCOPE_VAL_VOLTAGE_RMS Voltage RMS (cycle) IVISCOPE_VAL_VOLTAGE_CYCLE_RMS Voltage Min IVISCOPE_VAL_VOLTAGE_MIN Voltage Max IVISCOPE_VAL_VOLTAGE_MAX Voltage Vpp IVISCOPE_VAL_VOLTAGE_PEAK_TO_PEAK Voltage Low IVISCOPE_VAL_VOLTAGE_LOW Voltage High IVISCOPE_VAL_VOLTAGE_HIGH Voltage Average IVISCOPE_VAL_VOLTAGE_AVERAGE Voltage Average (cycle) IVISCOPE_VAL_VOLTAGE_CYCLE_AVERAGE Width Negative IVISCOPE_VAL_WIDTH_NEG Width Positive IVISCOPE_VAL_WIDTH_POS Duty Cycle Negative IVISCOPE_VAL_DUTY_CYCLE_NEG Duty Cycle Positive IVISCOPE_VAL_DUTY_CYCLE_POS Amplitude IVISCOPE_VAL_AMPLITUDE Overshoot IVISCOPE_VAL_OVERSHOOT Preshoot IVISCOPE_VAL_PRESHOOT    	          �    This function aborts an acquisition and returns the oscilloscope to the Idle state.  You initiate an acquisition with the IviScope_InitiateAcquisition function.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviScope_error_query function at the conclusion of the sequence.

(2) If the instrument cannot abort an initiated acquisition, this function returns the IVI_ERROR_FUNCTION_NOT_SUPPORTED error.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   ��-   �  �    Instrument Handle                �B#����  �    Status                                 	          &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           �.-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviScope_error_message function.  To obtain additional information about the error condition, use the IviScope_GetError and IviScope_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

     �    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Valid Return Values:
0 - Self test passed
1 - Self test failed


     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �< =  �  �    Self Test Result                 � = � � ,    Self-Test Message                ��#����  �    Status                           �
-   �  �    Instrument Handle                  	           	            	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviScope_error_message function.  To obtain additional information about the error condition, use the IviScope_GetError and IviScope_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �L#����  �    Status                           ��-   �  �    Instrument Handle                  	               P    This function invalidates the cached values of all attributes for the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviScope_error_message function.  To obtain additional information about the error condition, use the IviScope_GetError and IviScope_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           �.-   �  �    Instrument Handle                  	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �� = 3 �  �    Instrument Driver Revision       �[ =6 �  �    Firmware Revision                ��#����  �    Status                           �-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   � =  �  �    Error Code                       �f = � � ,    Error Message                    ��#����  �    Status                           �-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     %u    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
IviScope Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call IviScope_error_query.
BFFA0002  Cannot open file.
BFFA0003  Error reading from file.
BFFA0004  Error writing to file.
BFFA0005  Driver module file not found.
BFFA0006  Cannot open driver module file for reading.
BFFA0007  Driver module has invalid file format or invalid data.
BFFA0008  Driver module contains undefined references.
BFFA0009  Cannot find function in driver module.
BFFA000A  Failure loading driver module.
BFFA000B  Invalid path name.
BFFA000C  Invalid attribute.
BFFA000D  IVI attribute is not writable.
BFFA000E  IVI attribute is not readable.
BFFA000F  Invalid parameter.
BFFA0010  Invalid value.
BFFA0011  Function not supported.
BFFA0012  Attribute not supported.
BFFA0013  Value not supported.
BFFA0014  Invalid type.
BFFA0015  Types do not match.
BFFA0016  Attribute already has a value waiting to be updated.
BFFA0017  Specified item already exists.
BFFA0018  Not a valid configuration.
BFFA0019  Requested item does not exist or value not available.
BFFA001A  Requested attribute value not known.
BFFA001B  No range table.
BFFA001C  Range table is invalid.
BFFA001D  Object or item is not initialized.
BFFA001E  Non-interchangeable behavior.
BFFA001F  No channel table has been built for the session.
BFFA0020  Channel name specified is not valid.
BFFA0021  Unable to allocate system resource.
BFFA0022  Permission to access file was denied.
BFFA0023  Too many files are already open.
BFFA0024  Unable to create temporary file in target directory.
BFFA0025  All temporary filenames already used.
BFFA0026  Disk is full.
BFFA0027  Cannot find configuration file on disk.
BFFA0028  Cannot open configuration file.
BFFA0029  Error reading configuration file.
BFFA002A  Invalid ViInt32 value in configuration file.
BFFA002B  Invalid ViReal64 value in configuration file.
BFFA002C  Invalid ViBoolean value in configuration file.
BFFA002D  Entry missing from configuration file.
BFFA002E  Initialization failed in driver DLL.
BFFA002F  Driver module has unresolved external reference.
BFFA0030  Cannot find CVI Run-Time Engine.
BFFA0031  Cannot open CVI Run-Time Engine.
BFFA0032  CVI Run-Time Engine has invalid format.
BFFA0033  CVI Run-Time Engine is missing required function(s).
BFFA0034  CVI Run-Time Engine initialization failed.
BFFA0035  CVI Run-Time Engine has unresolved external reference.
BFFA0036  Failure loading CVI Run-Time Engine.
BFFA0037  Cannot open DLL for read exports.
BFFA0038  DLL file is corrupt.
BFFA0039  No DLL export table in DLL.
BFFA003A  Unknown attribute name in default configuration file.
BFFA003B  Unknown attribute value in default configuration file.
BFFA003C  Memory pointer specified is not known.
BFFA003D  Unable to find any channel strings.
BFFA003E  Duplicate channel string.
BFFA003F  Duplicate virtual channel name.
BFFA0040  Missing virtual channel name.
BFFA0041  Bad virtual channel name.
BFFA0042  Unassigned virtual channel name.
BFFA0043  Bad virtual channel assignment.
BFFA0044  Channel name required.
BFFA0045  Channel name not allowed.
BFFA0046  Attribute not valid for channel.
BFFA0047  Attribute must be channel based.
BFFA0048  Channel already excluded.
BFFA0049  Missing option name (nothing before the '=').
BFFA004A  Missing option value (nothing after the '=').
BFFA004B  Bad option name.
BFFA004C  Bad option value.
BFFA004D  Operation only valid on a class driver session.
BFFA004E  "ivi.ini" filename is reserved.
BFFA004F  Duplicate run-time configuration entry.
BFFA0050  Index parameter is one-based.
BFFA0051  Index parameter is too high.
BFFA0052  Attribute is not cacheable.
BFFA0053  You cannot export a ViAddr attribute to the end-user.
BFFA0054  Bad channel string in channel string list.
BFFA0055  Bad prefix name in default configuration file.
         
VISA Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFF0002 Event enabled for one or more specified mechanisms.
3FFF0003 Event disabled for one or more specified mechanisms.
3FFF0004 Successful, but queue already empty.
3FFF0005 Specified termination character was read.
3FFF0006 Number of bytes transferred equals input count.
3FFF0077 Configuration non-existant or could not be loaded.
3FFF007D Open successful, but the device not responding.
3FFF0080 Wait successful, but more event objects available.
3FFF0082 Specified object reference is uninitialized.
3FFF0084 Attribute value not supported.
3FFF0085 Status code could not be interpreted.
3FFF0088 Specified I/O buffer type not supported.
3FFF0098 Successful,  but invoke no handlers for this event.
3FFF0099 Successful but session has nested shared locks.
3FFF009A Successful but session has nested exclusive locks.
3FFF009B Successful but operation not asynchronous.
         
ERRORS:
BFFF0000 Unknown system error (miscellaneous error).
BFFF000E Session or object reference is invalid.
BFFF000F Resource is locked.
BFFF0010 Invalid expression specified for search.
BFFF0011 Resource is not present in the system.
BFFF0012 Invalid resource reference specified.  Parsing error.
BFFF0013 Invalid access mode.
BFFF0015 Timeout expired before operation completed.
BFFF0016 Unable to deallocate session data structures.
BFFF001B Specified degree is invalid.
BFFF001C Specified job identifier is invalid.
BFFF001D Attribute is not supported by the referenced object.
BFFF001E Attribute state not supported by the referenced object.
BFFF001F Specified attribute is read-only.
BFFF0020 Lock type lock not supported by this resource.
BFFF0021 Invalid access key.
BFFF0026 Specified event type not supported by the resource.
BFFF0027 Invalid mechanism specified.
BFFF0028 A handler was not installed.
BFFF0029 Handler reference either invalid or was not installed.
BFFF002A Specified event context invalid.
BFFF002D Event queue for specified type has overflowed.
BFFF002F Event type must be enabled in order to receive.
BFFF0030 User abort during transfer.
BFFF0034 Violation of raw write protocol during transfer.
BFFF0035 Violation of raw read protocol during transfer.
BFFF0036 Device reported output protocol error during transfer.
BFFF0037 Device reported input protocol error during transfer.
BFFF0038 Bus error during transfer.
BFFF0039 Unable to queue asynchronous operation.
BFFF003A Unable to start operation because setup is invalid.
BFFF003B Unable to queue the asynchronous operation.
BFFF003C Insufficient resources to perform memory allocation.
BFFF003D Invalid buffer mask specified.
BFFF003E I/O error.
BFFF003F Format specifier invalid.
BFFF0041 Format specifier not supported.
BFFF0042 Trigger line is currently in use.
BFFF004A Service request not received for the session.
BFFF004E Invalid address space specified.
BFFF0051 Invalid offset specified.
BFFF0052 Invalid access width specified.
BFFF0054 Offset not accessible from this hardware.
BFFF0055 Source and destination widths are different.
BFFF0057 Session not currently mapped.
BFFF0059 Previous response still pending.
BFFF005F No listeners condition detected.
BFFF0060 Interface not currently the controller in charge.
BFFF0061 Interface not the system controller.
BFFF0067 Session does not support this operation.
BFFF006A A parity error occurred during transfer.
BFFF006B A framing error occurred during transfer.
BFFF006C An overrun error occurred during transfer.
BFFF0070 Offset not properly aligned for operation access width.
BFFF0071 Specified user buffer not valid.
BFFF0072 Resource valid, but VISA cannot access it.
BFFF0076 Width not supported by this hardware.
BFFF0078 Invalid parameter value, parameter unknown.
BFFF0079 Invalid protocol.
BFFF007B Invalid window size.
BFFF0080 Session currently contains a mapped window.
BFFF0081 Operation not implemented.
BFFF0083 Invalid length.
BFFF0091 Invalid mode.
BFFF009C Session did not have a lock on the resource.
BFFF009D The device does not export any memory.
BFFF009E VISA-required code library not located or not loaded.
         
VXIPnP Driver Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFC0101  Instrument does not have ID Query capability.
3FFC0102  Instrument does not have Reset capability.
3FFC0103  Instrument does not have Self-Test capability.
3FFC0104  Instrument does not have Error Query capability.
3FFC0105  Instrument does not have Revision Query capability.
          
ERRORS:
BFFC0001  Parameter 1 out of range, or error trying to set it.
BFFC0002  Parameter 2 out of range, or error trying to set it.
BFFC0003  Parameter 3 out of range, or error trying to set it.
BFFC0004  Parameter 4 out of range, or error trying to set it.
BFFC0005  Parameter 5 out of range, or error trying to set it.
BFFC0006  Parameter 6 out of range, or error trying to set it.
BFFC0007  Parameter 7 out of range, or error trying to set it.
BFFC0008  Parameter 8 out of range, or error trying to set it.
BFFC0011  Instrument failed the ID Query.
BFFC0012  Invalid response from instrument.
     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   �F =  �  h    Error Code                       �� = � � �    Error Message                    �^#����  �    Status                           ��-   �  �    Instrument Handle                  0    	            	           VI_NULL    `    The function returns the channel string that is in the channel table at an index you specify.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviScope_error_message function.  To obtain additional information about the error condition, use the IviScope_GetError and IviScope_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     =    A 1-based index into the channel table.

Default Value:  1
     �    Returns the channel string that is in the channel table at the index you specify.

Do not modify the contents of the channel string.    �    Pass the number of bytes in the ViChar array you specify for the Channel Name parameter.

If the channel name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Channel Name buffer parameter.

Default Value:  None   �-   �  �    Instrument Handle                ��#����  �    Status                           �k = 0 �  �    Index                            �� �& �  �    Channel String                   �> � / �  �    Buffer Size                            	           1    	                h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     Z    Returns the C session instrument handle you use to call the specific driver's functions.   �-   �  �    Instrument Handle                s#����  �    Status                           
� = � �  �    Specific Driver C Handle               	           	          �    After the read and fetch waveform functions execute, each element in the waveform array contains either a voltage or a value indicating that the oscilloscope could not sample a voltage.  The driver uses an IEEE defined NaN (Not a Number) value to mark as invalid each element in the waveform array for which the oscilloscope could not sample a voltage.  This function determines whether a value you pass from the waveform array is invalid.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    8    Returns whether the Element Value is a valid voltage or a value indicating that the oscilloscope could not sample a voltage.

Valid Return Values:
VI_TRUE  (1) - The Element Value indicates that the oscilloscope
               could not sample the voltage.
VI_FALSE (0) - The Element Value is a valid voltage.
    _    Pass one of the values from the waveform array returned by the read and fetch waveform functions.  The driver uses an IEEE defined NaN (Not a Number) value to mark as invalid each element in the waveform array for which the oscilloscope could not sample a voltage.  The driver determines whether the value you pass is invalid.

Default Value: None

   t#����  �    Status                           �#   �  �    Instrument Handle                P =2 �  �    Is Invalid                       � = l �  �    Element Value                      	               	              �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviScope_GetError or IviScope_ClearError.
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviScope_error_message function.  To obtain additional information about the error condition, use the IviScope_GetError and IviScope_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   �#����  �    Status                           !q-   �  �    Instrument Handle                "+ =B �  �    BufferSize                       % = Q �  �    Code                             %� � Q � �    Description                        	                   	           	           d    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the instrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviScope_GetError function, which occurs when a call to IviScope_init or IviScope_InitWithOptions fails.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviScope_error_message function.  To obtain additional information about the error condition, use the IviScope_GetError and IviScope_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   -;#����  �    Status                           1�-   �  �    Instrument Handle                  	              �    This function returns the interchangeability warnings associated with the IVI session.  It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior.  If the IVISCOPE_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve interchangeability warnings.  If the IVISCOPE_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.

The class driver performs interchangeability checking when the IVISCOPE_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE and you call one of the following functions:

IviScope_InitiateAcquisition ()
IviScope_ReadWaveform ()
IviScope_ReadMinMaxWaveform ()
IviScope_ReadWaveformMeasurement ()

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for the Interchange Warning buffer parameter.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

Interchangeability checking examines the attributes in a capability group only if you specify a value for at least one attribute within that group.  In general, the class driver generates interchangeability warnings when it encounters one of the following conditions:

(1) An attribute that affects the behavior of the instrument is in a state that you did not specify.

(2) You set a class-defined attribute to an instrument-specific value.

(3) You set the value of an attribute that the class driver defines as read-only.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session.  If there are no interchange warnings, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   ;�#����  �    Status or Required Size          D�-   �  �    Instrument Handle                E] = � �  �    Buffer Size                      Hd � Q � �    Interchange Warning                	                   	            �    The specific driver performs interchangeability checking if the IVISCOPE_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   MD-   �  �    Instrument Handle                M�#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviScope_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviScope_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviScope_ClearInterchangeWarnings function.     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   \k-   �  �    Instrument Handle                ]%#����  �    Status                                 	          q    This function obtains the coercion information associated with the IVI session.  It retrieves and clears the oldest instance in which the specific driver coerced a value you specified to another value.

If you set the IVISCOPE_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the specific driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  If the IVISCOPE_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve information from that list.  If the IVISCOPE_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view the coercion information.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

This buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into this buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to this buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for this parameter.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None
   j:#����  �    Status or Required Size          s-   �  �    Instrument Handle                s� � Q � �    Coercion Record                  w� = � �  �    Buffer Size                        	               	               :    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviScope_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviScope_LockSession returns successfully, no other threads can access the instrument session until you call IviScope_UnlockSession.

Use IviScope_LockSession and IviScope_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviScope_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviScope_LockSession with a call to IviScope_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviScope_LockSession and IviScope_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviScope_LockSession.  This allows you to call IviScope_UnlockSession just once at the end of the function. 
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviScope_LockSession or IviScope_UnlockSession in the same function.

The parameter is an input/output parameter.  IviScope_LockSession and IviScope_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviScope_LockSession does not lock the session again.  If the value is VI_FALSE, IviScope_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviScope_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviScope_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.

You can then call IviScope_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviScope_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviScope_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviScope_LockSession(vi, &haveLock);
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
    IviScope_UnlockSession(vi, &haveLock);
    return error;
}   ��#����  �    Status                           �-   �  �    Instrument Handle                �� H � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviScope_LockSession.  Refer to IviScope_LockSession for additional information on session locks.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviScope_LockSession or IviScope_UnlockSession in the same function.

The parameter is an input/output parameter.  IviScope_LockSession and IviScope_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviScope_LockSession does not lock the session again.  If the value is VI_FALSE, IviScope_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviScope_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviScope_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
You can then call IviScope_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviScope_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviScope_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviScope_LockSession(vi, &haveLock);
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
    IviScope_UnlockSession(vi, &haveLock);
    return error;
}   �#����  �    Status                           �$-   �  �    Instrument Handle                �� H � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviScope_close.

(2) After calling IviScope_close, you cannot use the instrument driver again until you call IviScope_init.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviScope_error_message function.  To obtain additional information about the error condition, call the IviScope_GetError function.  To clear the error information from the driver, call the IviScope_ClearError function.
          
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
3FFA2001  One of the elements in the waveform array is invalid.
  
ERRORS:
BFFA2001  Specified channel is not enabled.
BFFA2002  Unable to perform desired measurement operation.
BFFA2003  Maximum operation time exceeded.
BFFA2004  Invalid acquisition type.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviScope_init or IviScope_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           �-   �  �    Instrument Handle                  	            ����         -j  D             K.        init                                                                                                                                    ����         Ev  a�             K.        InitWithOptions                                                                                                                         ����         c�  t?             K.        ConfigureAcquisitionType                                                                                                                ����         u�  ��             K.        ConfigureAcquisitionRecord                                                                                                              ����         ��  ��             K.        ConfigureNumAverages                                                                                                                    ����         �`  �~             K.        ConfigureNumEnvelopes                                                                                                                   ����         �1  ��             K.        ConfigureInterpolation                                                                                                                  ����         ��  ��             K.        ConfigureInitiateContinuous                                                                                                             ����         �w  ��             K.        ConfigureChannel                                                                                                                        ����         �  �@             K.        ConfigureChanCharacteristics                                                                                                            ����         �p  ��             K.        ConfigureTrigger                                                                                                                        ����         �� �             K.        ConfigureTriggerCoupling                                                                                                                ����        � ^             K.        ConfigureTriggerModifier                                                                                                                ����        w -7             K.        ConfigureEdgeTriggerSource                                                                                                              ����        1 H�             K.        ConfigureTVTriggerSource                                                                                                                ����        N. Y�             K.        ConfigureTVTriggerLineNumber                                                                                                            ����        Zv r�             K.        ConfigureRuntTriggerSource                                                                                                              ����        v� ��             K.        ConfigureGlitchTriggerSource                                                                                                            ����        �� ��             K.        ConfigureWidthTriggerSource                                                                                                             ����        �� Ĝ             K.        ConfigureAcLineTriggerSlope                                                                                                             ����        �� �n             K.        ConfigureRefLevels                                                                                                                      ����        ֓ �             K.        ActualRecordLength                                                                                                                      ����        �N �+             K.        AutoProbeSenseValue                                                                                                                     ����        �! �             K.        SampleMode                                                                                                                              ����        ��              K.        SampleRate                                                                                                                              ����        � U             K.        AutoSetup                                                                                                                               ����        � +N             K.        SetAttributeViInt32                                                                                                                     ����        ,� Ek             K.        SetAttributeViReal64                                                                                                                    ����        G _�             K.        SetAttributeViString                                                                                                                    ����        a# y�             K.        SetAttributeViBoolean                                                                                                                   ����        {A ��             K.        SetAttributeViSession                                                                                                                   ����        �_ ��             K.        GetAttributeViInt32                                                                                                                     ����        �
 �{             K.        GetAttributeViReal64                                                                                                                    ����        �� �W             K.        GetAttributeViString                                                                                                                    ����        �� �D             K.        GetAttributeViBoolean                                                                                                                   ����        �� �             K.        GetAttributeViSession                                                                                                                   ����        2 "2             K.        CheckAttributeViInt32                                                                                                                   ����        #� 7�             K.        CheckAttributeViReal64                                                                                                                  ����        9k Mn             K.        CheckAttributeViString                                                                                                                  ����        O	 c             K.        CheckAttributeViBoolean                                                                                                                 ����        d� x�             K.        CheckAttributeViSession                                                                                                                 ����        zI ��         	    K.        ReadWaveform                                                                                                                            ����        � ��         
    K.        ReadMinMaxWaveform                                                                                                                      ����        �8 �             K.        ReadWaveformMeasurement                                                                                                                 ����        �7 "             K.        InitiateAcquisition                                                                                                                     ����        � �             K.        AcquisitionStatus                                                                                                                       ����        B )�             K.        FetchWaveform                                                                                                                           ����        +� L�         	    K.        FetchMinMaxWaveform                                                                                                                     ����        O* |m             K.        FetchWaveformMeasurement                                                                                                                ����        �� �d             K.        Abort                                                                                                                                   ����        �� ��             K.        reset                                                                                                                                   ����        �b �`             K.        ResetWithDefaults                                                                                                                       ����        �� ��             K.        self_test                                                                                                                               ����        �� ��             K.        Disable                                                                                                                                 ����        �+ ��             K.        InvalidateAllAttributes                                                                                                                 ����        �b ��             K.        revision_query                                                                                                                          ����        �� ��             K.        error_query                                                                                                                             ����        �� ��             K.        error_message                                                                                                                           ����        ��              K.        GetChannelName                                                                                                                          ����        I 
�             K.        GetSpecificDriverCHandle                                                                                                                ����        � �             K.        IsInvalidWfmElement                                                                                                                     ����        � (�             K.        GetError                                                                                                                                ����        )� 2�             K.        ClearError                                                                                                                              ����        3 K�             K.        GetNextInterchangeWarning                                                                                                               ����        L} U              K.        ClearInterchangeWarnings                                                                                                                ����        U� dG             K.        ResetInterchangeCheck                                                                                                                   ����        d� z�             K.        GetNextCoercionRecord                                                                                                                   ����        {� ��             K.        LockSession                                                                                                                             ����        �G ��             K.        UnlockSession                                                                                                                           ����        �g ��             K.        close                                                                                                                                                                                                                              �Initialize                                                                           �Initialize With Options                                                             "Configuration                                                                       #;Acquisition                                                                          �Configure Acquisition Type                                                           �Configure Acquisition Record                                                         �Configure Num of Averages [AA]                                                       �Configure Num of Envelopes[MmW]                                                      �Configure Interpolation [I]                                                          �Configure Init Continuous [CA]                                                      #�Channel                                                                              �Configure Channel                                                                    �Configure Chan Characteristics                                                      #�Trigger                                                                              �Configure Trigger                                                                    �Configure Trigger Coupling                                                           �Configure Trigger Modifier [TM]                                                      �Configure Edge Trigger Source                                                        �Configure TV Trig Source [TV]                                                        �Configure TV Trig Line Num [TV]                                                      �Configure Runt Trigger Src [RT]                                                      �Configure Glitch Trig Src [GT]                                                       �Configure Width Trigger Src[WT]                                                      �Configure AC Trigger Slope [AT]                                                     $�Measurement                                                                          �Configure Reference Levels [WM]                                                     %EConfiguration Information                                                            �Actual Record Length                                                                 �Auto Probe Sense Value [PAS]                                                         �Actual Sample Mode [SM]                                                              �Actual Sample Rate                                                                   �Auto Setup [AS]                                                                     %�Set/Get/Check Attribute                                                             &Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             &�Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             'Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           '�Waveform Acquisition                                                                 �Read Waveform                                                                        �Read Min Max Waveform [MmW]                                                          �Read Waveform Measurement [WM]                                                      )DLow-level Acquisition                                                                �Initiate Acquisition                                                                 �Acquisition Status                                                                   �Fetch Waveform                                                                       �Fetch Min Max Waveform [MmW]                                                         �Fetch Waveform Measurement [WM]                                                      �Abort                                                                               *�Utility                                                                              �Reset                                                                                �Reset With Defaults                                                                  �Self-Test                                                                            �Disable                                                                              �Invalidate All Attributes                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Get Channel Name                                                                     �Get Specific Driver C Handle                                                         �Is Invalid Waveform Element                                                         ,Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         ,^Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             ,�Coercion Info                                                                        �Get Next Coercion Record                                                            ,�Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           