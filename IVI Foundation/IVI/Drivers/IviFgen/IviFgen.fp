s��   	     !   r ع  Ah   �   ����                                IviFgen                         IviFgen Class Driver                                                                                  � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr  � � ��ViUInt16  � � ��ViUInt32  � � ��ViInt64  � � ��ViUInt64     	�  ViInt64[]  4�    This instrument driver provides programming support for the IviFgen Class.  The driver contains all the functions that the IVI Foundation and VXIplug&play Systems Alliance require.  This driver requires the VISA and IVI libraries.
      
Use this driver to develop programs that are independent of a particular function generator.  You can use this class driver with any function generator that has an IVI instrument-specific driver that is compliant with the IviFgen class.  The IviFgen class driver accesses the specific driver for your instrument using the configuration information you supply with the IVI configuration utility.
      
The IviFgen class driver divides instrument capabilities into a fundamental capabilities group and multiple extension capability groups.  The IviFgen fundamental capabilities group supports function generators capable of configuring output impedances and the reference clock source, and enabling and disabling the function generator's outputs. The fundamental capabilities alone do not support the generation of an output signal. Instead, a  function generator must support at least one of the signal output extensions:  IviFgenStdFunc, IviFgenArbWfm, or IviFgenArbSeq.  The fundamental group consists of the following functions and attributes.  These functions and attributes are implemented by all function generator instrument drivers that are compliant with the IviFgen class.
      
      IviFgen_ConfigureOutputMode()
      IviFgen_ConfigureOperationMode()
      IviFgen_ConfigureRefClockSource()
      IviFgen_ConfigureOutputImpedance()
      IviFgen_ConfigureOutputEnabled()
      IviFgen_InitiateGeneration()
      IviFgen_AbortGeneration()

      IVIFGEN_ATTR_OUTPUT_MODE
      IVIFGEN_ATTR_REF_CLOCK_SOURCE
      IVIFGEN_ATTR_OUTPUT_ENABLED
      IVIFGEN_ATTR_OUTPUT_IMPEDANCE
      IVIFGEN_ATTR_OPERATION_MODE

The IviFgen class driver identifies functions and attributes that belong to an extension group with the following abbreviations.  Instrument-specific drivers are not required to implement any of the extension capability groups.  If you use functions and attributes that belong to extension capability groups, every instrument-specific driver that you use must implement those extensions.
      
      Extension Capability Group        Abbreviation
      ----------------------------------------------
      IviFgenStdFunc                         [STD]
      IviFgenArbWfm                          [ARB]
      IviFgenArbFrequency                    [AF]
      IviFgenArbSeq                          [SEQ]
      IviFgenTrigger                         [TRG]
      IviFgenStartTrigger                    [STT]
      IviFgenStopTrigger                     [SPT]
      IviFgenHoldTrigger                     [HT]
      IviFgenResumeTrigger                   [RT]
      IviFgenAdvanceTrigger                  [AT]
      IviFgenInternalTrigger                 [IT]
      IviFgenSoftwareTrigger                 [SWT]
      IviFgenBurst                           [BST]
      IviFgenModulateAM                      [AM]
      IviFgenModulateFM                      [FM]
      IviFgenSampleClock                     [SC]
      IviFgenTerminalConfiguration           [TC]
      IviFgenArbWfmSize64                    [ARB64]
      IviFgenArbChannelWfm                   [ACH]
      IviFgenArbWfmBinary                    [AB]
      IviFgenDataMarker                      [DM]  
      IviFgenArbDataMask                     [DMSK]
      IviFgenSparseMarker                    [SM]
      IviFgenArbSeqDepth                     [SEQD]
    
The IviFgenStdFunc group defines extensions for instruments capable of generating standard periodic waveforms.  This group consists of the following functions and attributes:

      IviFgen_ConfigureStandardWaveform()

      IVIFGEN_ATTR_FUNC_WAVEFORM
      IVIFGEN_ATTR_FUNC_AMPLITUDE
      IVIFGEN_ATTR_FUNC_DC_OFFSET
      IVIFGEN_ATTR_FUNC_FREQUENCY
      IVIFGEN_ATTR_FUNC_START_PHASE
      IVIFGEN_ATTR_FUNC_DUTY_CYCLE_HIGH

The IviFgenArbWfm group defines extensions for instruments capable of generating a user-defined arbitrary waveforms.  This
group consists of the following functions and attributes:

      IviFgen_ConfigureSampleRate()
      IviFgen_QueryArbWfmCapabilities()
      IviFgen_CreateArbWaveform()
      IviFgen_ConfigureArbWaveform()
      IviFgen_ClearArbWaveform()

      IVIFGEN_ATTR_ARB_WAVEFORM_HANDLE
      IVIFGEN_ATTR_ARB_GAIN
      IVIFGEN_ATTR_ARB_OFFSET
      IVIFGEN_ATTR_ARB_SAMPLE_RATE
      IVIFGEN_ATTR_MAX_NUM_WAVEFORMS
      IVIFGEN_ATTR_WAVEFORM_QUANTUM
      IVIFGEN_ATTR_MIN_WAVEFORM_SIZE
      IVIFGEN_ATTR_MAX_WAVEFORM_SIZE

The IviFgenArbFrequency group defines extensions for instruments capable of setting the rate at which an entire arbitrary waveform is generated.  This group consists of the following functions and attributes:

      IviFgen_ConfigureArbFrequency()

      IVIFGEN_ATTR_ARB_FREQUENCY

The IviFgenArbSeq group defines extensions for instruments capable of generating a user-defined sequence of arbitrary waveforms.  This group consists of the following functions and attributes:

      IviFgen_QueryArbSeqCapabilities()
      IviFgen_CreateArbSequence()
      IviFgen_ConfigureArbSequence()
      IviFgen_ClearArbSequence()
      IviFgen_ClearArbMemory()

      IVIFGEN_ATTR_ARB_SEQUENCE_HANDLE
      IVIFGEN_ATTR_MAX_NUM_SEQUENCES
      IVIFGEN_ATTR_MIN_SEQUENCE_LENGTH
      IVIFGEN_ATTR_MAX_SEQUENCE_LENGTH
      IVIFGEN_ATTR_MAX_LOOP_COUNT

The IviFgenTrigger group defines extensions for instruments capable of producing a signal upon receipt of a trigger, and of generating a fixed number of waveform cycles.  This group consists of the following functions and attributes:

      IviFgen_ConfigureTriggerSource()

      IVIFGEN_ATTR_TRIGGER_SOURCE

The IviFgenStartTrigger group defines extensions for instruments capable of configuring a start trigger. A start trigger initiates generation of a waveform or sequence. This Extension group deprecates the IviFgenTrigger extension group.  This group consists of the following functions and attributes:

      IviFgen_ConfigureStartTrigger()
      
      IVIFGEN_ATTR_START_TRIGGER_DELAY
      IVIFGEN_ATTR_START_TRIGGER_SLOPE
      IVIFGEN_ATTR_START_TRIGGER_SOURCE
      IVIFGEN_ATTR_START_TRIGGER_THRESHOLD

The IviFgenStopTrigger group defines extensions for instruments capable of configuring a stop trigger. A stop trigger terminates any generation and has the same effect as calling the AbortGeneration function. This group consists of the following functions and attributes:

      IviFgen_ConfigureStopTrigger()
      
      IVIFGEN_ATTR_STOP_TRIGGER_DELAY
      IVIFGEN_ATTR_STOP_TRIGGER_SLOPE
      IVIFGEN_ATTR_STOP_TRIGGER_SOURCE
      IVIFGEN_ATTR_STOP_TRIGGER_THRESHOLD

The IviFgenHoldTrigger group defines extensions for instruments capable of configuring a hold trigger. A hold trigger pauses generation. This group consists of the following functions and attributes:

      IviFgen_ConfigureHoldTrigger()
      
      IVIFGEN_ATTR_HOLD_TRIGGER_DELAY
      IVIFGEN_ATTR_HOLD_TRIGGER_SLOPE
      IVIFGEN_ATTR_HOLD_TRIGGER_SOURCE
      IVIFGEN_ATTR_HOLD_TRIGGER_THRESHOLD

The IviFgenResumeTrigger group defines extensions for instruments capable of configuring a resume trigger. A resume trigger resumes generation after it has been paused by a hold trigger, starting with the next point. This group consists of the following functions and attributes:

      IviFgen_ConfigureResumeTrigger()
      
      IVIFGEN_ATTR_RESUME_TRIGGER_DELAY
      IVIFGEN_ATTR_RESUME_TRIGGER_SLOPE
      IVIFGEN_ATTR_RESUME_TRIGGER_SOURCE
      IVIFGEN_ATTR_RESUME_TRIGGER_THRESHOLD

The IviFgenAdvanceTrigger group defines extensions for instruments capable of configuring an advance trigger. An advance trigger advances generation to the end of the current waveform, where generation proceeds according to the current configuration. This group consists of the following functions and attributes:

      IviFgen_ConfigureAdvanceTrigger()
      
      IVIFGEN_ATTR_ADVANCE_TRIGGER_DELAY
      IVIFGEN_ATTR_ADVANCE_TRIGGER_SLOPE
      IVIFGEN_ATTR_ADVANCE_TRIGGER_SOURCE
      IVIFGEN_ATTR_ADVANCE_TRIGGER_THRESHOLD

The IviFgenInternalTrigger group defines extensions for instruments capable of generate output based on an internally generated trigger signal.  This group consists of the following functions and attributes:

      IviFgen_ConfigureInternalTriggerRate()

      IVIFGEN_ATTR_INTERNAL_TRIGGER_RATE

The IviFgenSoftwareTrigger extension group defines extensions for an instrument that can initiate signal generation based on a software trigger signal.  This group consists of the following function:
      
      IviFgen_SendSoftwareTrigger()

The IviFgenBurst group defines extensions for instruments capable of of generating a discrete number of waveform cycles based on a trigger.  This group consists of the following functions and attributes:

      IviFgen_ConfigureBurstCount()

      IVIFGEN_ATTR_BURST_COUNT

The IviFgenModulateAM group defines extensions for an instrument capable of applying amplitude modulation to an output signal.  This group consists of the following functions and attributes:

      IviFgen_ConfigureAMEnabled()
      IviFgen_ConfigureAMSource()
      IviFgen_ConfigureAMInternal()

      IVIFGEN_ATTR_AM_ENABLED
      IVIFGEN_ATTR_AM_SOURCE
      IVIFGEN_ATTR_AM_INTERNAL_DEPTH
      IVIFGEN_ATTR_AM_INTERNAL_WAVEFORM
      IVIFGEN_ATTR_AM_INTERNAL_FREQUENCY

The IviFgenModulateFM group defines extensions for an instrument capable of applying frequency modulation to an output signal.  This group consists of the following functions and attributes:

      IviFgen_ConfigureFMEnabled()
      IviFgen_ConfigureFMSource()
      IviFgen_ConfigureFMInternal()

      IVIFGEN_ATTR_FM_ENABLED
      IVIFGEN_ATTR_FM_SOURCE
      IVIFGEN_ATTR_FM_INTERNAL_DEVIATION
      IVIFGEN_ATTR_FM_INTERNAL_WAVEFORM
      IVIFGEN_ATTR_FM_INTERNAL_FREQUENCY

The IviFgenSampleClock group defines extensions for an instrument capable of using (or providing) an external sample clock. This group consists of the following functions and attributes:

      IviFgen_ConfigureSampleClock()
      IviFgen_ConfigureSampleClockOutputEnabled()

      IVIFGEN_ATTR_SAMPLE_CLOCK_SOURCE
      IVIFGEN_ATTR_SAMPLE_CLOCK_OUTPUT_ENABLED

The IviFgenTerminalConfiguration group defines extensions for an instrument ability to specify whether the output terminals are single-ended or differential. This group consists of the following attribute:

      IVIFGEN_ATTR_OUTPUT_TERMINAL_CONFIGURATION

The IviFgenArbWfmSize64 group defines extensions for an instrument capable of producing user-defined arbitrary waveforms of sizes larger than can be represented by a 32-bit integer. This group consists of the following function and attributes:

      IviFgen_QueryArbWfmCapabilities64()
      
      IVIFGEN_ATTR_MAX_WAVEFORM_SIZE64
      IVIFGEN_ATTR_MIN_WAVEFORM_SIZE64

The IviFgenArbChannelWfm group defines extensions for an instrument capable of producing user-defined arbitrary waveforms for specific output channels. This group consists of the following function:

      IviFgen_CreateChannelArbWaveform()

The IviFgenArbWfmBinary group defines extensions for an instrument capable of producing user-defined arbitrary waveforms that can be specified in binary format. This group consists of the following functions and attributes:

      IviFgen_CreateChannelArbWaveform16()
      IviFgen_CreateChannelArbWaveform32()

      IVIFGEN_ATTR_BINARY_ALIGNMENT
      IVIFGEN_ATTR_SAMPLE_BIT_RESOLUTION

The IviFgenDataMarker group defines extensions for an instrument capable of outputing particular bits of waveform data as a marker output. This group consists of the following functions and attributes:

      IviFgen_ConfigureDataMarker()
      IviFgen_GetDataMarkerName()
      IviFgen_DisableAllDataMarkers()

      IVIFGEN_ATTR_DATAMARKER_AMPLITUDE
      IVIFGEN_ATTR_DATAMARKER_BIT_POSITION
      IVIFGEN_ATTR_DATAMARKER_COUNT
      IVIFGEN_ATTR_DATAMARKER_DELAY
      IVIFGEN_ATTR_DATAMARKER_DESTINATION
      IVIFGEN_ATTR_DATAMARKER_POLARITY
      IVIFGEN_ATTR_DATAMARKER_SOURCE_CHANNEL

The IviFgenArbDataMask group defines extensions for an instrument ability to mask out bits of the output data. This group consists of the following attribute:

      IVIFGEN_ATTR_OUTPUT_DATA_MASK

The IviFgenSparseMarker group defines extensions for an instrument capable of outputing signals, known as markers, associated with specified samples in the output data. Unlike data markers, sparse markers are not stored as part of the waveform data, but rather provided as a list of particular samples of the waveform on which the marker should be output. This group consists of the following functions and attributes:

      IviFgen_ConfigureSparseMarker()
      IviFgen_GetSparseMarkerName()
      IviFgen_GetSparseMarkerIndexes()
      IviFgen_SetSparseMarkerIndexes()
      IviFgen_DisableAllSparseMarkers()

      IVIFGEN_ATTR_DATAMARKER_AMPLITUDE
      IVIFGEN_ATTR_DATAMARKER_BIT_POSITION
      IVIFGEN_ATTR_DATAMARKER_COUNT
      IVIFGEN_ATTR_DATAMARKER_DELAY
      IVIFGEN_ATTR_DATAMARKER_DESTINATION
      IVIFGEN_ATTR_DATAMARKER_POLARITY
      IVIFGEN_ATTR_DATAMARKER_SOURCE_CHANNEL

The IviFgenArbDataMask group defines extensions for an instrument producing sequences of sequences of arbitrary waveforms. This group consists of the following attribute:

      IIVIFGEN_ATTR_SEQUENCE_DEPTH_MAX
    �    This class contains functions and sub-classes that configure the function generator.  The class contains high-level functions that configure standard waveform generation, arbitrary waveform generation, arbitrary sequence generation, triggering, amplitude modulation, and frequency modulation.  The class also contains the low-level functions that set, get, and check individual attribute values.
    �    This class contains functions that configure the function generator to produce standard waveform output.  These periodic signals are characterized by their waveform, amplitude, DC offset, frequency, and start phase.  Some waveforms may require additional parameters to characterize their output.  For example, a square wave requires a duty cycle parameter in addition to those parameters listed above.
        This class contains functions that configure the function generator to produce arbitrary waveform output, create arbitrary waveforms, and clear arbitrary waveforms.  

An arbitrary waveform consists of a user-specified array of normalized data that function generator can produce.     �    This class contains functions that configure the function generator to produce arbitrary waveform output and specify the rate at which an entire arbitrary waveform is generated.
    �    This class contains functions that configure the function generator to produce arbitrary sequence output, create arbitrary sequences, and clear arbitrary sequences.  

An arbitrary sequence consists of multiple arbitrary waveforms.  For each waveform, you specify the number of times the function generator produces the waveform before proceeding to the next waveform.  The number of times to repeat a specific waveform is called the loop count.
     F    This class contains functions that configure the triggering source.
     K    This class contains functions that configure the internal trigger source.     �    This class contains functions that configure the number of waveform cycles the function generator produces when in the burst operation mode.    P    This class contains functions that configure the data markers for arbitrary waveform generators to output. Data markers are particular bits of waveform data.   

The configurations for data markers include which bit(the 2nd bit for example) gets output, where the output goes, and various analog characteristics of the marker output. 

Data markers are repeated capabilities to allow you to output multiple bits to different ouputs simultaneously. You also can use the IVIFGEN_ATTR_OUTPUT_DATA_MASK attribute to ensure that the data marker does not get output with the main waveform output.    �    This class contains functions that configure the sparse markers for arbitrary waveform generators to output. Sparse markers are signals associated with specified samples in the output data.  Unlike data markers, sparse markers are not stored as part of the waveform data, but rather provided as a list of particular samples of the waveform on which the marker should be output.  

The configurations for sparse markers include which waveform and sample number the output is associated with, where the output goes, and various analog characteristics of the marker output. 

Sparse markers are repeated capabilities to allow you to specify multiple markers to different outputs simultaneously.
    �    This class contains functions that configure the modulating signal and apply amplitude modulation to a carrier signal.

Amplitude modulation produces an output signal by varying the amplitude of a carrier signal according to the amplitude of a modulating signal.  You specify the carrier signal with the functions in either the Standard Function Output class or the Arbitrary Waveform Output class.  The modulating signal can be an internally generated or an externally generated signal.

    �    This class contains functions that configure the modulating signal and apply frequency modulation to a carrier signal.

Frequency modulation produces an output signal by varying the frequency of a carrier signal according to the frequency of a modulating signal.  You specify the carrier signal with the functions in either the Standard Function Output class or the Arbitrary Waveform Output class.  The modulating signal can be an internally generated or an externally generated signal.

     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     j    This class contains functions and classes that initiate instrument operations and report their status.

    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     ?    This class contains functions that retrieve coercion records.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    C    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviFgen_LockSession and IviFgen_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use. The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session. You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleFGen"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument. When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument. Although you can create more than one IVI session for the same resource, it is best not to do so. A better approach is to use the same IVI session in multiple execution threads. You can use functions IviFgen_LockSession and IviFgen_UnlockSession to protect sections of code that require exclusive access to the resource.

        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    S� =   �  �    Logical Name                      W� : �       ID Query                          Y� =� �       Reset Device                      Z{ �C �  �    Instrument Handle                 ]4#����  �    Status                             "SampleFGen"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          C    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviFgen_LockSession and IviFgen_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use. The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session. You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleFGen"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviFgen_LockSession and IviFgen_UnlockSession to protect sections of code that require exclusive access to the resource.

        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
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
RangeCheck        IVIFGEN_ATTR_RANGE_CHECK
QueryInstrStatus  IVIFGEN_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIFGEN_ATTR_CACHE   
Simulate          IVIFGEN_ATTR_SIMULATE  
RecordCoercions   IVIFGEN_ATTR_RECORD_COERCIONS
InterchangeCheck  IVIFGEN_ATTR_INTERCHANGE_CHECK

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the driver uses the values from the Measurement and Automation Explorer's IVI Configuration Utility.   You can override these values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, the driver uses the value from the IVI Configuration Utility.  

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    l =   �  �    Logical Name                      o� : �       ID Query                          q� =� �       Reset Device                      r� �Y �  �    Instrument Handle                 uN#����  �    Status                            |j �  � �    Option String                      "SampleFGen"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"       This function configures the output mode of the function generator. The output mode determines the kind of waveform the function generator produces. For example, you can select to generate a standard waveform, an arbitrary waveform, or a sequence of arbitrary waveforms.        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init  function. The handle identifies a particular instrument session.

Default Value:  None
    
    Pass the output mode you want the function generator to use.  The driver sets the IVIFGEN_ATTR_OUTPUT_MODE attribute to this value. The value you specify determines which functions and attributes you use to configure the waveform the function generator produces.

When you set this parameter to IVIFGEN_VAL_OUTPUT_FUNC, you use the following function to configure the waveform:

- IviFgen_ConfigureStandardWaveform

In place of using this function, you can set the following attributes:

- IVIFGEN_ATTR_FUNC_WAVEFORM     
- IVIFGEN_ATTR_FUNC_AMPLITUDE 
- IVIFGEN_ATTR_FUNC_DC_OFFSET   
- IVIFGEN_ATTR_FUNC_FREQUENCY 
- IVIFGEN_ATTR_FUNC_START_PHASE   
- IVIFGEN_ATTR_FUNC_DUTY_CYCLE_HIGH

When you set this parameter to IVIFGEN_VAL_OUTPUT_ARB, you use the following functions to configure the waveform:

- IviFgen_QueryArbWfmCapabilities
- IviFgen_CreateArbWaveform  
- IviFgen_CreateChannelArbWaveform
- IviFgen_CreateChannelArbWaveform16
- IviFgen_CreateChannelArbWaveform32
- IviFgen_ClearArbWaveform
- IviFgen_ConfigureSampleRate
- IviFgen_ConfigureArbWaveform 

In place of using the IviFgen_ConfigureSampleRate and IviFgen_ConfigureArbWaveform functions, you can set the following attributes:

- IVIFGEN_ATTR_ARB_WAVEFORM_HANDLE  
- IVIFGEN_ATTR_ARB_GAIN
- IVIFGEN_ATTR_ARB_OFFSET  
- IVIFGEN_ATTR_ARB_SAMPLE_RATE 

If your instrument allows you to specify the rate at which an entire arbitrary waveform is generated, you can also use the following function to configure arbitrary waveforms:

- IviFgen_ConfigureArbFrequency

In place of using the IviFgen_ConfigureArbFrequency function, you can set the following attribute:

- IVIFGEN_ATTR_ARB_FREQUENCY

When you set this parameter to IVIFGEN_VAL_OUTPUT_SEQ, you use the following functions to configure the sequence:

- IviFgen_QueryArbWfmCapabilities
- IviFgen_QueryArbWfmCapabilities64
- IviFgen_CreateArbWaveform  
- IviFgen_ClearArbWaveform
- IviFgen_QueryArbSeqCapabilities
- IviFgen_CreateArbWaveform
- IviFgen_ClearArbSequence
- IviFgen_ClearArbMemory
- IviFgen_ConfigureSampleRate
- IviFgen_ConfigureArbSequence

In place of using the IviFgen_ConfigureSampleRate and IviFgen_ConfigureArbSequence functions, you can set the following attributes:

- IVIFGEN_ATTR_ARB_SEQUENCE_HANDLE  
- IVIFGEN_ATTR_ARB_GAIN
- IVIFGEN_ATTR_ARB_OFFSET  
- IVIFGEN_ATTR_ARB_SAMPLE_RATE 

Defined Values:
IVIFGEN_VAL_OUTPUT_FUNC - Standard Function Output
IVIFGEN_VAL_OUTPUT_ARB  - Arbitrary Waveform Output
IVIFGEN_VAL_OUTPUT_SEQ  - Arbitrary Sequence output
 
Default Value:
IVIFGEN_VAL_OUTPUT_FUNC - Standard Function Output
    �#����  �    Status                            �7-   �  �    Instrument Handle                 �� = � � �    Output Mode                        	                          ~Standard Function IVIFGEN_VAL_OUTPUT_FUNC Arbitrary Waveform IVIFGEN_VAL_OUTPUT_ARB Arbitrary Sequence IVIFGEN_VAL_OUTPUT_SEQ   ,    This function configures the operation mode of the function generator.  The operation mode determines how the function generator produces output on a channel.  For example, you can select to generate output continuously or to generate a discrete number of waveform cycles based on a trigger event.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init  function. The handle identifies a particular instrument session.

Default Value:  None
    N    Pass the operation mode you want the function generator to use.  The driver sets the IVIFGEN_ATTR_OPERATION_MODE attribute to this value.

Defined Values:
IVIFGEN_VAL_OPERATE_CONTINUOUS - continuous generation
IVIFGEN_VAL_OPERATE_BURST      - burst generation
 
Default Value:
IVIFGEN_VAL_OPERATE_CONTINUOUS - continuous generation
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �\#����  �    Status                            �x-   �  �    Instrument Handle                 � = � � �    Operation Mode                    �k >  �  �    Channel Name                       	                          JContinuous IVIFGEN_VAL_OPERATE_CONTINUOUS Burst IVIFGEN_VAL_OPERATE_BURST    ""    v    This function configures whether the signal the function generator produces appears at a channel's output connector.        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
        Pass whether you want the signal that the function generator produces to appear at the output channel you specify.  The driver sets the IVIFGEN_ATTR_OUTPUT_ENABLED attribute to this value.

Valid Values:
VI_TRUE  - Output Enabled
VI_FALSE - Output Disabled

Default Value: VI_TRUE
    �#����  �    Status                            �,-   �  �    Instrument Handle                 �� =  �  �    Channel Name                      �� = � �  �    Output Enabled                     	               ""  " Enabled VI_TRUE Disabled VI_FALSE    M    This function configures the output impedance for the channel you specify.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
        Pass the impedance value you want the function generator to use.  The driver sets the IVIFGEN_ATTR_OUTPUT_IMPEDANCE attribute to this value.  A value of 0.00 indicates that the output channel is connected to a high impedance load.

Default Value:  50.0 ohms
    �N#����  �    Status                            �j-   �  �    Instrument Handle                 �! =  �  �    Channel Name                      � = � �  �    Impedance                          	               ""    50.0    �    This function configures the function generator's reference clock source. The function generator uses the reference clock to derive frequencies and sample rates when generating output.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the reference clock source you want the function generator to use. The driver sets the IVIFGEN_ATTR_REF_CLOCK_SOURCE attribute to this value.

The function generator derives the frequencies and sample rates that it uses to generate waveforms from the source you specify.  For example, when you set this parameter to IVIFGEN_VAL_REF_CLOCK_EXTERNAL, the function generator uses
the signal it receives at its external clock terminal as its reference clock.

Defined Values:
IVIFGEN_VAL_REF_CLOCK_INTERNAL   - internal clock source
IVIFGEN_VAL_REF_CLOCK_EXTERNAL   - external clock source
IVIFGEN_VAL_REF_CLOCK_RTSI_CLOCK - RTSI clock source

Default: 
IVIFGEN_VAL_REF_CLOCK_INTERNAL - internal clock source
    ��#����  �    Status                            ��-   �  �    Instrument Handle                 ̙ = � � �    Reference Clock Source             	                          |Internal IVIFGEN_VAL_REF_CLOCK_INTERNAL External IVIFGEN_VAL_REF_CLOCK_EXTERNAL RTSI Clock IVIFGEN_VAL_REF_CLOCK_RTSI_CLOCK    �    This function configures the sample clock source for the function generator.

Notes:

(1) This function is part of the IviFgenSampleClock [SC] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init  function. The handle identifies a particular instrument session.

Default Value:  None
        Pass the sample clock source you want the function generator to use.  The driver sets the IVIFGEN_ATTR_SAMPLE_CLOCK_SOURCE attribute to the value you specify. The value you specify determines the clock used for the waveform generation.

If you want to set this parameter to IVIFGEN_VAL_SAMPLE_CLOCK_SOURCE_EXTERNAL, you must first set the arbitrary sample rate to the corresponding frequency of the external sample clock. You can use the IviFgen_ConfigureSampleRate function or set the IVIFGEN_ATTR_ARB_SAMPLE_RATE attribute to configure the arbitrary sample rate.

Defined Values:
IVIFGEN_VAL_SAMPLE_CLOCK_SOURCE_INTERNAL - Use the internal sample clock.
IVIFGEN_VAL_SAMPLE_CLOCK_SOURCE_EXTERNAL - Use an external sample clock.
 
Default Value:
IVIFGEN_VAL_SAMPLE_CLOCK_SOURCE_INTERNAL
    �L#����  �    Status                            �h-   �  �    Instrument Handle                 � = � � �    Sample Clock Source                	                          dInternal IVIFGEN_VAL_SAMPLE_CLOCK_SOURCE_INTERNAL External IVIFGEN_VAL_SAMPLE_CLOCK_SOURCE_EXTERNAL    �    This function configures whether the sample clock appears at the sample clock output of the generator.

Notes:

(1) This function is part of the IviFgenSampleClock [SC] extension group.        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init  function. The handle identifies a particular instrument session.

Default Value:  None
    *    Pass whether you want the sample clock to appear at the sample clock output of the generator. The driver sets the IVIFGEN_ATTR_SAMPLE_CLOCK_OUTPUT_ENABLED attribute to this value.

Valid Values:
VI_TRUE  - Enable sample clock output
VI_FALSE - Disable sample clock output

Default Value: VI_TRUE
    �#����  �    Status                            �#-   �  �    Instrument Handle                 �� = � �  �    Sample Clock Output Enabled        	             "  Enabled VI_TRUE Disabled VI_FALSE       This function configures the attributes of the function generator that affect standard waveform generation. These attributes are the waveform, amplitude, DC offset, frequency, and start phase.

Notes:

(1) This function is part of the IviFgenStdFunc [STD] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the amplitude of the standard waveform that you want the function generator to produce. This value is the amplitude at the output terminal. The driver sets the IVIFGEN_ATTR_FUNC_AMPLITUDE attribute to this value. For example,  to produce a waveform ranging from -5.00 to +5.00 volts, set the amplitude to 10.00 volts.

Units: Volts peak-to-peak (Vpp)

Default Value: None

Note: This parameter does not affect function generator behavior when you set the Waveform parameter to IVIFGEN_VAL_WFM_DC.
    �    Pass the DC offset of the standard waveform that you want the function generator to produce. This value is the offset at the output terminal. The value is the offset from ground to the center of the waveform you specify with the Waveform parameter.  The driver sets the IVIFGEN_ATTR_FUNC_DC_OFFSET attribute to this value. For example, to configure a waveform with an amplitude of 10.00 volts to range from 0.00 volts to +10.00 volts, set the DC Offset to 5.00 volts.

Units: Volts (V)

Default Value: None
    M    Pass the frequency of the standard waveform that you want the function generator to produce. The driver sets the IVIFGEN_ATTR_FUNC_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Default Value: None

Note: This parameter does not affect function generator behavior when you set the Waveform parameter to IVIFGEN_VAL_WFM_DC.
    x    Pass the horizontal offset of the standard waveform you want the the function generator to produce. You specify this attribute in degrees of one waveform cycle. The driver sets the IVIFGEN_ATTR_FUNC_START_PHASE attribute to this value. A start phase of 180 degrees means output generation begins half way through the waveform. A start phase of 360 degrees offsets the output by an entire waveform cycle, which is identical to a start phase of 0 degrees.


Units: Degrees of one cycle

Default Value: None

Note: This parameter does not affect function generator behavior when you set the Waveform parameter to IVIFGEN_VAL_WFM_DC.
        Pass the standard waveform that you want the function generator to produce.  The driver sets the IVIFGEN_ATTR_FUNC_WAVEFORM attribute to this value.

Valid Values:
IVIFGEN_VAL_WFM_SINE      - Sinusoid waveform
IVIFGEN_VAL_WFM_SQUARE    - Square waveform 
IVIFGEN_VAL_WFM_TRIANGLE  - Triangle waveform
IVIFGEN_VAL_WFM_RAMP_UP   - Positive ramp waveform 
IVIFGEN_VAL_WFM_RAMP_DOWN - Negative ramp waveform 
IVIFGEN_VAL_WFM_DC        - Constant voltage

Default Value:
IVIFGEN_VAL_WFM_SINE      - Sinusoid waveform
    ��#����  �    Status                            ��-   �  �    Instrument Handle                 � =  �  �    Channel Name                      �� =� �  �    Amplitude                         �� �  �  �    DC Offset                         �� � � �  �    Frequency                         �� �� �  �    Start Phase                       �q = � � �    Waveform                           	               ""                               �Sine IVIFGEN_VAL_WFM_SINE Square IVIFGEN_VAL_WFM_SQUARE Triangle IVIFGEN_VAL_WFM_TRIANGLE Ramp Up IVIFGEN_VAL_WFM_RAMP_UP Ramp Down IVIFGEN_VAL_WFM_RAMP_DOWN DC IVIFGEN_VAL_WFM_DC    �    This function removes a previously created arbitrary waveform from the function generator's memory and invalidates the waveform's handle.

Notes:

(1) This function is part of the IviFgenArbWfm [ARB] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the handle of the arbitrary waveform you want the function generator to remove. You create multiple arbitrary waveforms using the IviFgen_CreateArbWaveform function. The IviFgen_CreateArbWaveform function returns a handle that you use to identify each waveform.

Defined Values:
IVIFGEN_VAL_ALL_WAVEFORMS - Remove all waveforms from the function generator.
    
Default Value: None
   �#����  �    Status                           	-   �  �    Instrument Handle                	� = � �  �    Waveform Handle                    	                      This function configures the attributes of the function generator that affect arbitrary waveform generation. These attributes are the arbitrary waveform handle, gain, and offset.

Notes:

(1) This function is part of the IviFgenArbWfm [ARB] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the handle of the arbitrary waveform you want the function generator to produce. The driver sets the IVIFGEN_ATTR_ARB_WAVEFORM_HANDLE attribute to this value. 

Create an arbitrary waveform using the following functions:

-  IviFgen_CreateArbWaveform
-  IviFgen_CreateChannelArbWaveform
-  IviFgen_CreateChannelArbWaveform16
-  IviFgen_CreateChannelArbWaveform32

These functions return a handle that you use to identify the waveform.

Default Value: None
    �    Specifies the factor by which the function generator scales the arbitrary waveform data. When you create arbitrary waveforms, you must first normalize the data points to a range of -1.00 to +1.00. You use this attribute to scale the arbitrary waveform to other ranges. The driver sets the IVIFGEN_ATTR_ARB_GAIN attribute to this value. For example, to configure the output signal to range from -2.00 volts to +2.00 volts, set the gain to 2.00.

Units: Volts (V)

Default Value: None
    �    Specifies the value the function generator adds to the arbitrary waveform data. When you create arbitrary waveforms, you must first normalize the data points to a range of -1.00 to +1.00.  You use this parameter to shift the arbitrary waveform's range.  The driver sets the IVIFGEN_ATTR_ARB_OFFSET attribute to this value. For example, to configure the output signal to range from 0.00 volts to 2.00 volts instead of -1.00 volts to 1.00 volts, set the Offset to 1.00.

Units: Volts (V)

Default Value: None
   #����  �    Status                           *-   �  �    Instrument Handle                � =  �  �    Channel Name                     � = � �  �    Waveform Handle                  � =| �  �    Gain                             � z  �  �    Offset                             	               ""               p    This function configures the sample rate attribute, which determines the rate at which the function generator produces arbitrary waveforms. When you configure the function generator to produce an arbitrary sequence, this is the sample rate for all arbitrary waveforms in the sequence.
  
Notes:

(1) This function is part of the IviFgenArbWfm [ARB] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
     �    Pass the sample rate at which you want the function generator to output arbitrary waveforms. The driver sets the IVIFGEN_ATTR_ARB_SAMPLE_RATE attribute to this value. 

Units: Samples-per-second (Samp/s)

Default Value: None
   !e#����  �    Status                           (�-   �  �    Instrument Handle                )8 = � �  �    Sample Rate (Samp/s)               	                  �    This function creates an arbitrary waveform and returns a handle that identifies that waveform. You pass this handle to the IviFgen_ConfigureArbWaveform function to produce that waveform.  You also use the handles this function returns to specify a sequence of arbitrary waveforms with the IviFgen_CreateArbSequence function.

Notes:

(1) This function is part of the IviFgenArbWfm [ARB] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    .    Pass the size of the arbitrary waveform you want create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the Maximum Waveform Size, Minimum Waveform Size, and Waveform Quantum parameters of the IviFgen_QueryArbWfmCapabilities function.


Default Value: None
        Specify the array of data you want to use for the new arbitrary waveform. The array must have at least as many elements as the value you specify in the Waveform Size parameter.

You must normalize the data points in the array to be between -1.00 and +1.00.

Default Value: None
        Returns the handle that identifies the new arbitrary waveform.  You pass this handle to the IviFgen_ConfigureArbWaveform function to generate the arbitrary waveform. You pass an array of these handles to the IviFgen_CreateArbSequence function to create an arbitrary sequence.
   ,u#����  �    Status                           3�-   �  �    Instrument Handle                4H =  �  �    Waveform Size                    6~ = � �  �    Waveform Data Array              7� =| �  �    Waveform Handle                    	                       	           �    This function creates a channel-specific arbitrary waveform and returns a handle that identifies that waveform. You pass this handle to the IviFgen_ConfigureArbWaveform function to produce that waveform.  You also use the handles this function returns to specify a sequence of arbitrary waveforms with the IviFgen_CreateArbSequence function.

If the function generator cannot store any more arbitrary waveforms, this function returns the error No Waveforms Available (0xBFFA2004).

If the instrument does not support channel-based arbitrary waveform creation, use the IviFgen_CreateArbWaveform function.  

Use following functions to create a channel-specific arbitrary
waveform if you want to pass data in 16-bit or 32-bit binary:

-  IviFgen_CreateChannelArbWaveform16
-  IviFgen_CreateChannelArbWaveform32 

Notes:

(1) This function is part of the IviFgenArbChannelWfm [ACH] extension group. 
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    ,    Pass the size of the arbitrary waveform you want to create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the maximumWaveformSize, minimumWaveformSize, and waveformQuantum parameters of the IviFgen_QueryArbWfmCapabilities function.


Default Value: None
    �    Specify the array of data you want to use for the new arbitrary waveform. The array must have at least as many elements as the value you specify in the waveformSize parameter.

You must normalize the data points in the array to be between -1.00 and +1.00.

When you create a multi-channel waveform, this array is the concatenation of the waveform arrays for each channel. In this case, all waveforms must be of the same length.

Default Value: None
        Returns the handle that identifies the new arbitrary waveform.  Pass this handle to the IviFgen_ConfigureArbWaveform function to generate the arbitrary waveform. Pass an array of these handles to the IviFgen_CreateArbSequence function to create an arbitrary sequence.
    \    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

If the instrument has multiple channels, you can pass a comma-separated list of channel names to create multi-channel waveform.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   =t#����  �    Status                           D�-   �  �    Instrument Handle                EG = � �  �    Waveform Size                    G{ =x �  �    Waveform Data Array              IF � � �  �    Waveform Handle                  J\ =  �  �    Channel Name                       	                       	            ""   �    This function creates a channel-specific arbitrary waveform and returns a handle that identifies that waveform. Data is passed in as 16-bit binary data. If the arbitrary waveform generator supports formats smaller than 16 bits, read the IVIFGEN_ATTR_BINARY_ALIGNMENT attribute to determine whether to left or right justify the data before passing it to this call. 

You pass this handle to the IviFgen_ConfigureArbWaveform function to produce that waveform.  You also use the handles this function returns to specify a sequence of arbitrary waveforms with the IviFgen_CreateArbSequence function.

If the function generator cannot store any more arbitrary waveforms, this function returns the error No Waveforms Available (0xBFFA2004).

If the instrument does not support channel-based arbitrary waveform creation, use the IviFgen_CreateArbWaveform function.

Use the IviFgen_CreateChannelArbWaveform32 function to create a channel-specific arbitrary waveform if you want to pass data in 32-bit binary.

Use the IviFgen_CreateChannelArbWaveform function to create a channel-specific arbitrary waveform with normalized data.

Note:

(1) This function is part of the IviFgenArbWfmBinary [AB] extension group.         Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    (    Pass the size of the arbitrary waveform you want create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the maximumWaveformSize, minimumWaveformSize, and waveformQuantum parameters of the IviFgen_QueryArbWfmCapabilities function.

Default Value: None
    s    Specify the array of data you want to use for the new arbitrary waveform. The array must have at least as many elements as the value you specify in the waveformSize parameter.

When you create a multi-channel waveform, this array is the concatenation of the waveform arrays for each channel. In this case, all waveforms must be of the same length.

Default Value: None
        Returns the handle that identifies the new arbitrary waveform.  Pass this handle to the IviFgen_ConfigureArbWaveform function to generate the arbitrary waveform. Pass an array of these handles to the IviFgen_CreateArbSequence function to create an arbitrary sequence.
    _    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

If the instrument has multiple channels, you can pass a comma-separated list of channel names to create multi-channel waveforms. 

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   T�#����  �    Status                           \-   �  �    Instrument Handle                \� = � �  �    Waveform Size                    ^� =x �  �    Waveform Data Array              `f � � �  �    Waveform Handle                  a| =  �  �    Channel Name                       	                       	            ""   �    This function creates a channel-specific arbitrary waveform and returns a handle that identifies that waveform. Data is passed in as 32-bit binary data. If the arbitrary waveform generator supports formats smaller than 32 bits, read the IVIFGEN_ATTR_BINARY_ALIGNMENT attribute to determine whether to left or right justify the data before passing it to this call. 

Pass this handle to the IviFgen_ConfigureArbWaveform function to produce that waveform.  You also use the handles this function returns to specify a sequence of arbitrary waveforms with the IviFgen_CreateArbSequence function.

If the function generator cannot store any more arbitrary waveforms, this function returns the error No Waveforms Available (0xBFFA2004).

If the instrument does not support channel-based arbitrary waveform creation, use the IviFgen_CreateArbWaveform function.

Use the IviFgen_CreateChannelArbWaveform16 function to create a channel-specific arbitrary waveform if you want to pass data in 16-bit binary.

Use the IviFgen_CreateChannelArbWaveform function to create a channel-specific arbitrary waveform with normalized data.   

Note:

(1) This function is part of the IviFgenArbWfmBinary [AB] extension group. 
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    (    Pass the size of the arbitrary waveform you want create.

The size must meet the following restrictions:

    - The size is less than or equal to the maximum waveform size the instrument allows.

    - The size is greater than or equal to the minimum waveform size the instrument allows.

    - The size is an integer multiple of the instrument's waveform quantum.

    You can obtain these values from the maximumWaveformSize, minimumWaveformSize, and waveformQuantum parameters of the IviFgen_QueryArbWfmCapabilities function.

Default Value: None
    s    Specify the array of data you want to use for the new arbitrary waveform. The array must have at least as many elements as the value you specify in the waveformSize parameter.

When you create a multi-channel waveform, this array is the concatenation of the waveform arrays for each channel. In this case, all waveforms must be of the same length.

Default Value: None
        Returns the handle that identifies the new arbitrary waveform.  Pass this handle to the IviFgen_ConfigureArbWaveform function to generate the arbitrary waveform. Pass an array of these handles to the IviFgen_CreateArbSequence function to create an arbitrary sequence.
    _    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

If the instrument has multiple channels, you can pass a comma-separated list of channel names to create multi-channel waveforms. 

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   l#����  �    Status                           s'-   �  �    Instrument Handle                s� = � �  �    Waveform Size                    v =x �  �    Waveform Data Array              w� � � �  �    Waveform Handle                  x� =  �  �    Channel Name                       	                       	            ""   �    This function returns the attributes of the function generator that are related to creating arbitrary waveforms. These attributes are the maximum number of waveforms, waveform quantum, minimum waveform size, and maximum waveform size.

This function is the 32-bit version of the IviFgen_QueryArbWfmCapabilities64 function.

Note:

(1) This function is part of the IviFgenArbWfm [ARB] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
     �    Returns the maximum number of arbitrary waveforms that the function generator allows. The driver obtains this value from the IVIFGEN_ATTR_MAX_NUM_WAVEFORMS attribute.

    Y    The size, or number of points, of each waveform must be a multiple of a constant quantum value. This parameter obtains the quantum value the function generator uses. The driver gets this value from the IVIFGEN_ATTR_WAVEFORM_QUANTUM attribute.  For example, when this attribute returns a value of 8, all waveform sizes must be a multiple of 8.
     �    Returns the minimum number of points the function generator allows in a waveform. The driver obtains this value from the IVIFGEN_ATTR_MIN_WAVEFORM_SIZE attribute.  

     �    Returns the maximum number of points the function generator allows in a waveform. The driver obtains this value from the IVIFGEN_ATTR_MAX_WAVEFORM_SIZE attribute.

   �	#����  �    Status                           �%-   �  �    Instrument Handle                �� = " �  �    Maximum Number of Waveforms      �� = � �  �    Waveform Quantum                 �� =� �  �    Minimum Waveform Size            �� � # �  �    Maximum Waveform Size              	               	            	            	            	           �    This function returns the attributes of the function generator that are related to creating arbitrary waveforms. These attributes are the maximum number of waveforms, waveform quantum, minimum waveform size, and maximum waveform size.

This function is the 64-bit version of the IviFgen_QueryArbWfmCapabilities function.

Note:

(1) This function is part of the IviFgenArbWfmSize64 [ARB64] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
     �    Returns the maximum number of arbitrary waveforms that the function generator allows. The driver obtains this value from the IVIFGEN_ATTR_MAX_NUM_WAVEFORMS attribute.

    Y    The size, or number of points, of each waveform must be a multiple of a constant quantum value. This parameter obtains the quantum value the function generator uses. The driver gets this value from the IVIFGEN_ATTR_WAVEFORM_QUANTUM attribute.  For example, when this attribute returns a value of 8, all waveform sizes must be a multiple of 8.
     �    Returns the minimum number of points the function generator allows in a waveform. The driver obtains this value from the IVIFGEN_ATTR_MIN_WAVEFORM_SIZE64 attribute.  

     �    Returns the maximum number of points the function generator allows in a waveform. The driver obtains this value from the IVIFGEN_ATTR_MAX_WAVEFORM_SIZE64 attribute.

   �l#����  �    Status                           ��-   �  �    Instrument Handle                �? = " �  �    Maximum Number of Waveforms      �� = � �  �    Waveform Quantum                 �R =� �  �    Minimum Waveform Size            � � # �  �    Maximum Waveform Size              	               	            	            	            	            �    This function configures the arbitrary waveform frequency attribute, which determines the rate at which the function generator produces entire arbitrary waveforms.
  
Notes:

(1) This function is part of the IviFgenArbFrequency [AF] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass the frequency you want the function generator to use.  The driver sets the IVIFGEN_ATTR_ARB_FREQUENCY attribute to this value.

Default Value:  None
   �6#����  �    Status                           �R-   �  �    Instrument Handle                �	 =  �  �    Channel Name                     �� = � �  �    Frequency                          	               ""       <    This function returns the attributes of the function generator that are related to creating arbitrary sequences. These attributes are the maximum number of sequences, minimum sequence length, maximum sequence length, and maximum loop count.

Note: This function is part of the IviFgenArbSeq [SEQ] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
     �    Returns the maximum number of arbitrary waveform sequences that the function generator allows. The driver obtains this value from the IVIFGEN_ATTR_MAX_NUM_SEQUENCES attribute.  

     �    Returns the minimum number of arbitrary waveforms the function generator allows in a sequence. The driver obtains this value from the IVIFGEN_ATTR_MIN_SEQUENCE_LENGTH attribute.

     �    Returns the maximum number of arbitrary waveforms the function generator allows in a sequence. The driver obtains this value from the IVIFGEN_ATTR_MAX_SEQUENCE_LENGTH attribute.
 
     �    Returns the maximum number of times the function generator can repeat an arbitrary waveform in a sequence. The driver obtains this value from the IVIFGEN_ATTR_MAX_LOOP_COUNT attribute.


   ��#����  �    Status                           ��-   �  �    Instrument Handle                �� = " �  �    Maximum Number of Sequences      �S = � �  �    Minimum Sequence Length          � =� �  �    Maximum Sequence Length          �� � # �  �    Maximum Loop Count                 	               	            	            	            	           �    An arbitrary sequence consists of multiple waveforms. For each waveform, you specify the number of times the function generator produces the waveform before proceeding to the next waveform.  The number of times to repeat a specific waveform is called the loop count.
 
This function creates an arbitrary sequence from an array of waveform handles and an array of corresponding loop counts. The function returns a handle that identifies the sequence. You pass this handle to the IviFgen_ConfigureArbSequence function to specify what arbitrary sequence you want the function generator to produce.

Notes:

(1) This function is part of the IviFgenArbSeq [SEQ] extension group.

        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of waveforms in the new arbitrary sequence you want to create. The value you pass must be between the minimum and maximum sequence lengths the function generator allows. You can obtain the minimum and maximum sequence lengths from the Minimum Sequence Length and Maximum Sequence Length parameters of the IviFgen_QueryArbSeqCapabilities function.

Default Value: None
    �    Pass the array of waveform handles from which you want to create a new arbitrary sequence. The array must have at least as many elements as the value you specify in the Sequence Length parameter. Each Waveform Handles array element has a corresponding Loop Counts array element that indicates how many times that waveform is repeated. You obtain waveform handles when you create arbitrary waveforms with the IviFgen_CreateArbWaveform function.

Default Value: None
    Y    Pass the array of loop counts you want to use to create a new arbitrary sequence. The array must have at least as many elements as the value you specify in the Sequence Length parameter. Each Loop Counts array element corresponds to a Waveform Handles array element and indicates how many times to repeat that waveform. Each element of the Loop Count array must be less than or equal to the maximum number of loop counts the function generator allows. You can obtain the maximum loop count from the Maximum Loop Count parameter of the IviFgen_QueryArbSeqCapabilities function.


Default Value: None
     �    Returns the handle that identifies the new arbitrary sequence.  You pass this handle to the IviFgen_ConfigureArbSequence function to generate the arbitrary sequence.
   ��#����  �    Status                           ��-   �  �    Instrument Handle                �� =  �  �    Sequence Length                  � = � �  �    Waveform Handles Array           �� =| �  �    Loop Counts Array                �X z  �  �    Sequence Handle                    	                           	               This function configures the attributes of the function generator that affect arbitrary sequence generation. These attributes are the arbitrary sequence handle, gain, and offset.

Notes:

(1) This function is part of the IviFgenArbSeq [SEQ] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    j    Pass the handle of the arbitrary sequence you want the function generator to produce.  The driver sets the IVIFGEN_ATTR_ARB_SEQUENCE_HANDLE attribute to this value. You create an arbitrary sequence using the IviFgen_CreateArbSequence function. The IviFgen_CreateArbSequence function returns a handle that you use to identify the sequence.

Default Value: None
    �    Specifies the factor by which the function generator scales the arbitrary waveforms in the sequence. When you create arbitrary waveforms, you must first normalize the data points to a range of -1.00 to +1.00. You use this attribute to scale the waveforms in the sequence to other ranges. The driver sets the IVIFGEN_ATTR_ARB_GAIN attribute to this value.  For example, to configure the output signal to range from -2.00 volts to +2.00 volts, set the gain to 2.00.

Units: Volts (V)


Default Value: None        Specifies the value the function generator adds to the arbitrary waveforms in the sequence. When you create arbitrary waveforms, you must first normalize the data points to a range of -1.00 to +1.00.  You use this parameter to shift the ranges of the arbitrary waveforms in the sequence. The driver sets the IVIFGEN_ATTR_ARB_OFFSET attribute to this value. For example,  to configure the output signal to range from 0.00 volts to 2.00 volts instead of -1.00 volts to 1.00 volts, set the Offset to 1.00.

Units: None


Default Value: None
   �z#����  �    Status                           і-   �  �    Instrument Handle                �M =  �  �    Channel Name                     �0 = � �  �    Sequence Handle                  ע =| �  �    Gain                             ٣ z  �  �    Offset                             	               ""                �    This function removes a previously created arbitrary sequence from the function generator's memory and invalidates the sequence's handle.

Notes:

(1) This function is part of the IviFgenArbSeq [SEQ] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the handle of the arbitrary sequence you want the function generator to remove. You create multiple arbitrary sequences using the IviFgen_CreateArbSequence function. The IviFgen_CreateArbSequence function returns a handle that you use to identify each sequence.

Defined Values:
IVIFGEN_VAL_ALL_SEQUENCES - Remove all sequences from the function generator.
    
 
Default Value: None
   �
#����  �    Status                           �&-   �  �    Instrument Handle                �� = � �  �    Sequence Handle                    	                   �    This function removes all previously created arbitrary waveforms and sequences from the function generator's memory. It also invalidates all waveform and sequence handles.

Notes:

(1) This function is part of the IviFgenArbSeq [SEQ] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �$#����  �    Status                           �@-   �  �    Instrument Handle                  	               �    This function configures the function generator's trigger source.

Notes:

(1) This function is part of the IviFgenTrigger [TRG] extension group.
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Specify the trigger source you want to use. The driver sets the
IVIFGEN_ATTR_TRIGGER_SOURCE attribute to this
value.

After the function generator receives a trigger, the function generator produces an output signal based on the value of the IVIFGEN_ATTR_OPERATION_MODE attribute.

Defined Values:
IVIFGEN_VAL_INTERNAL_TRIGGER - Internal
IVIFGEN_VAL_EXTERNAL         - External
IVIFGEN_VAL_SOFTWARE_TRIG    - Software Trigger Function
IVIFGEN_VAL_TTL0             - PXI TRIG0 or VXI TTL0
IVIFGEN_VAL_TTL1             - PXI TRIG1 or VXI TTL1
IVIFGEN_VAL_TTL2             - PXI TRIG2 or VXI TTL2
IVIFGEN_VAL_TTL3             - PXI TRIG3 or VXI TTL3
IVIFGEN_VAL_TTL4             - PXI TRIG4 or VXI TTL4
IVIFGEN_VAL_TTL5             - PXI TRIG5 or VXI TTL5
IVIFGEN_VAL_TTL6             - PXI TRIG6 or VXI TTL6
IVIFGEN_VAL_TTL7             - PXI TRIG7 or VXI TTL7
IVIFGEN_VAL_ECL0             - VXI ECL0
IVIFGEN_VAL_ECL1             - VXI ECL1
IVIFGEN_VAL_PXI_STAR         - PXI Star
IVIFGEN_VAL_RTSI_0           - RTSI line 0
IVIFGEN_VAL_RTSI_1           - RTSI line 1
IVIFGEN_VAL_RTSI_2           - RTSI line 2
IVIFGEN_VAL_RTSI_3           - RTSI line 3
IVIFGEN_VAL_RTSI_4           - RTSI line 4
IVIFGEN_VAL_RTSI_5           - RTSI line 5
IVIFGEN_VAL_RTSI_6           - RTSI line 6
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   �-   �  �    Instrument Handle                ��#����  �    Status                           �� = � � �    Trigger Source                   �� = " �  �    Channel Name                           	                     �Internal IVIFGEN_VAL_INTERNAL_TRIGGER External IVIFGEN_VAL_EXTERNAL Software Trigger Function IVIFGEN_VAL_SOFTWARE_TRIG PXI TRIG0 or VXI TTL0 IVIFGEN_VAL_TTL0 PXI TRIG1 or VXI TTL1 IVIFGEN_VAL_TTL1 PXI TRIG2 or VXI TTL2 IVIFGEN_VAL_TTL2 PXI TRIG3 or VXI TTL3 IVIFGEN_VAL_TTL3 PXI TRIG4 or VXI TTL4 IVIFGEN_VAL_TTL4 PXI TRIG5 or VXI TTL5 IVIFGEN_VAL_TTL5 PXI TRIG6 or VXI TTL6 IVIFGEN_VAL_TTL6 PXI TRIG7 or VXI TTL7 IVIFGEN_VAL_TTL7 ECL0 IVIFGEN_VAL_ECL0 ECL1 IVIFGEN_VAL_ECL1 PXI Star IVIFGEN_VAL_PXI_STAR RTSI 0 IVIFGEN_VAL_RTSI_0 RTSI 1 IVIFGEN_VAL_RTSI_1 RTSI 2 IVIFGEN_VAL_RTSI_2 RTSI 3 IVIFGEN_VAL_RTSI_3 RTSI 4 IVIFGEN_VAL_RTSI_4 RTSI 5 IVIFGEN_VAL_RTSI_5 RTSI 6 IVIFGEN_VAL_RTSI_6    ""   -    This function configures the attributes that control the function generator's start trigger. These attributes are the start trigger source and slope.

A start trigger initiates generation of a waveform or sequence. 

Note:

(1) This function is part of the IviFgenStartTrigger [STT] extension group.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Specifies the slope of the start trigger. The driver sets the IVIFGEN_ATTR_START_TRIGGER_SLOPE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
IVIFGEN_VAL_TRIGGER_NEGATIVE - Triggers on a negative slope.
IVIFGEN_VAL_TRIGGER_EITHER   - Triggers on either a positive or negative slope.

Default: 
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
    �    Specifies the source of the start trigger. The driver sets the IVIFGEN_ATTR_START_TRIGGER_SOURCE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_SOURCE_NONE      - No trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately
IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL  - External trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL  - Internal trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE  - Software trigger 
IVIFGEN_VAL_TRIGGER_SOURCE_LAN0      - LAN0
IVIFGEN_VAL_TRIGGER_SOURCE_LAN1      - LAN1
IVIFGEN_VAL_TRIGGER_SOURCE_LAN2      - LAN2
IVIFGEN_VAL_TRIGGER_SOURCE_LAN3      - LAN3
IVIFGEN_VAL_TRIGGER_SOURCE_LAN4      - LAN4
IVIFGEN_VAL_TRIGGER_SOURCE_LAN5      - LAN5
IVIFGEN_VAL_TRIGGER_SOURCE_LAN6      - LAN6
IVIFGEN_VAL_TRIGGER_SOURCE_LAN7      - LAN7
IVIFGEN_VAL_TRIGGER_SOURCE_LXI0      - LXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_LXI1      - LXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_LXI2      - LXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_LXI3      - LXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_LXI4      - LXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_LXI5      - LXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_LXI6      - LXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_LXI7      - LXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_TTL0      - TTL Interface 0
IVIFGEN_VAL_TRIGGER_SOURCE_TTL1      - TTL Interface 1
IVIFGEN_VAL_TRIGGER_SOURCE_TTL2      - TTL Interface 2
IVIFGEN_VAL_TRIGGER_SOURCE_TTL3      - TTL Interface 3
IVIFGEN_VAL_TRIGGER_SOURCE_TTL4      - TTL Interface 4
IVIFGEN_VAL_TRIGGER_SOURCE_TTL5      - TTL Interface 5
IVIFGEN_VAL_TRIGGER_SOURCE_TTL6      - TTL Interface 6
IVIFGEN_VAL_TRIGGER_SOURCE_TTL7      - TTL Interface 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR  - PXI Star Interface
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA 
                                     - PXI Express DStar Line A
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB 
                                     - PXI Express DStar Line B
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC 
                                     - PXI Express DStar Line C
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI0     - RTSI Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1     - RTSI Bus Line 1 
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2     - RTSI Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3     - RTSI Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4     - RTSI Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5     - RTSI Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6     - RTSI Bus Line 6

Default: 
IVIFGEN_VAL_TRIGGER_SOURCE_NONE - No trigger source
   �-   �  �    Instrument Handle                b#����  �    Status                           ~ =  �  �    Channel Name                     a =| � �    Trigger Slope                     = � � �    Trigger Source                         	           ""               nPositive IVIFGEN_VAL_TRIGGER_POSITIVE Negative IVIFGEN_VAL_TRIGGER_NEGATIVE Either IVIFGEN_VAL_TRIGGER_EITHER            /  {None IVIFGEN_VAL_TRIGGER_SOURCE_NONE Immediate IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL Software IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIFGEN_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIFGEN_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIFGEN_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIFGEN_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIFGEN_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIFGEN_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIFGEN_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIFGEN_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIFGEN_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIFGEN_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIFGEN_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIFGEN_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIFGEN_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIFGEN_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIFGEN_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIFGEN_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIFGEN_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIFGEN_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIFGEN_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIFGEN_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIFGEN_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIFGEN_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIFGEN_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIFGEN_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI1 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6   \    This function configures the attributes that control the function generator's stop trigger.  These attributes are the stop trigger source and slope.

A stop trigger terminates any generation and has the same effect as calling the IviFgen_AbortGeneration function.

Note:

(1) This function is part of the IviFgenStopTrigger [SPT] extension group.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Specifies the slope of the stop trigger. The driver sets the IVIFGEN_ATTR_STOP_TRIGGER_SLOPE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
IVIFGEN_VAL_TRIGGER_NEGATIVE - Triggers on a negative slope.
IVIFGEN_VAL_TRIGGER_EITHER   - Triggers on either a positive or negative slope.

Default: 
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
    �    Specifies the source of the stop trigger. The driver sets the IVIFGEN_ATTR_STOP_TRIGGER_SOURCE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_SOURCE_NONE      - No trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately
IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL  - External trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL  - Internal trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE  - Software trigger 
IVIFGEN_VAL_TRIGGER_SOURCE_LAN0      - LAN0
IVIFGEN_VAL_TRIGGER_SOURCE_LAN1      - LAN1
IVIFGEN_VAL_TRIGGER_SOURCE_LAN2      - LAN2
IVIFGEN_VAL_TRIGGER_SOURCE_LAN3      - LAN3
IVIFGEN_VAL_TRIGGER_SOURCE_LAN4      - LAN4
IVIFGEN_VAL_TRIGGER_SOURCE_LAN5      - LAN5
IVIFGEN_VAL_TRIGGER_SOURCE_LAN6      - LAN6
IVIFGEN_VAL_TRIGGER_SOURCE_LAN7      - LAN7
IVIFGEN_VAL_TRIGGER_SOURCE_LXI0      - LXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_LXI1      - LXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_LXI2      - LXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_LXI3      - LXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_LXI4      - LXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_LXI5      - LXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_LXI6      - LXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_LXI7      - LXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_TTL0      - TTL Interface 0
IVIFGEN_VAL_TRIGGER_SOURCE_TTL1      - TTL Interface 1
IVIFGEN_VAL_TRIGGER_SOURCE_TTL2      - TTL Interface 2
IVIFGEN_VAL_TRIGGER_SOURCE_TTL3      - TTL Interface 3
IVIFGEN_VAL_TRIGGER_SOURCE_TTL4      - TTL Interface 4
IVIFGEN_VAL_TRIGGER_SOURCE_TTL5      - TTL Interface 5
IVIFGEN_VAL_TRIGGER_SOURCE_TTL6      - TTL Interface 6
IVIFGEN_VAL_TRIGGER_SOURCE_TTL7      - TTL Interface 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR  - PXI Star Interface
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA 
                                     - PXI Express DStar Line A
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB 
                                     - PXI Express DStar Line B
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC 
                                     - PXI Express DStar Line C
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI0     - RTSI Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1     - RTSI Bus Line 1 
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2     - RTSI Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3     - RTSI Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4     - RTSI Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5     - RTSI Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6     - RTSI Bus Line 6

Default: 
IVIFGEN_VAL_TRIGGER_SOURCE_NONE - No trigger source
   +y-   �  �    Instrument Handle                ,0#����  �    Status                           3L =  �  �    Channel Name                     7/ =| � �    Trigger Slope                    8� = � � �    Trigger Source                         	           ""               nPositive IVIFGEN_VAL_TRIGGER_POSITIVE Negative IVIFGEN_VAL_TRIGGER_NEGATIVE Either IVIFGEN_VAL_TRIGGER_EITHER            /  {None IVIFGEN_VAL_TRIGGER_SOURCE_NONE Immediate IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL Software IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIFGEN_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIFGEN_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIFGEN_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIFGEN_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIFGEN_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIFGEN_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIFGEN_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIFGEN_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIFGEN_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIFGEN_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIFGEN_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIFGEN_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIFGEN_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIFGEN_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIFGEN_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIFGEN_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIFGEN_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIFGEN_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIFGEN_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIFGEN_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIFGEN_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIFGEN_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIFGEN_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIFGEN_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI1 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6   �    This function configures the attributes that control the function generator's hold trigger. These attributes are the hold trigger source and slope.

A hold trigger pauses generation. From the paused state, a resume trigger resumes generation, a stop trigger terminates generation, and start trigger behavior is vendor defined. 

Note:

(1) This function is part of the IviFgenHoldTrigger [HT] extension group.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Specifies the slope of the hold trigger. The driver sets the IVIFGEN_ATTR_HOLD_TRIGGER_SLOPE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
IVIFGEN_VAL_TRIGGER_NEGATIVE - Triggers on a negative slope.
IVIFGEN_VAL_TRIGGER_EITHER   - Triggers on either a positive or negative slope.

Default: 
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
    �    Specifies the source of the hold trigger. The driver sets the IVIFGEN_ATTR_HOLD_TRIGGER_SOURCE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_SOURCE_NONE      - No trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately
IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL  - External trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL  - Internal trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE  - Software trigger 
IVIFGEN_VAL_TRIGGER_SOURCE_LAN0      - LAN0
IVIFGEN_VAL_TRIGGER_SOURCE_LAN1      - LAN1
IVIFGEN_VAL_TRIGGER_SOURCE_LAN2      - LAN2
IVIFGEN_VAL_TRIGGER_SOURCE_LAN3      - LAN3
IVIFGEN_VAL_TRIGGER_SOURCE_LAN4      - LAN4
IVIFGEN_VAL_TRIGGER_SOURCE_LAN5      - LAN5
IVIFGEN_VAL_TRIGGER_SOURCE_LAN6      - LAN6
IVIFGEN_VAL_TRIGGER_SOURCE_LAN7      - LAN7
IVIFGEN_VAL_TRIGGER_SOURCE_LXI0      - LXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_LXI1      - LXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_LXI2      - LXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_LXI3      - LXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_LXI4      - LXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_LXI5      - LXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_LXI6      - LXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_LXI7      - LXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_TTL0      - TTL Interface 0
IVIFGEN_VAL_TRIGGER_SOURCE_TTL1      - TTL Interface 1
IVIFGEN_VAL_TRIGGER_SOURCE_TTL2      - TTL Interface 2
IVIFGEN_VAL_TRIGGER_SOURCE_TTL3      - TTL Interface 3
IVIFGEN_VAL_TRIGGER_SOURCE_TTL4      - TTL Interface 4
IVIFGEN_VAL_TRIGGER_SOURCE_TTL5      - TTL Interface 5
IVIFGEN_VAL_TRIGGER_SOURCE_TTL6      - TTL Interface 6
IVIFGEN_VAL_TRIGGER_SOURCE_TTL7      - TTL Interface 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR  - PXI Star Interface
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA 
                                     - PXI Express DStar Line A
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB 
                                     - PXI Express DStar Line B
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC 
                                     - PXI Express DStar Line C
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI0     - RTSI Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1     - RTSI Bus Line 1 
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2     - RTSI Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3     - RTSI Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4     - RTSI Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5     - RTSI Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6     - RTSI Bus Line 6

Default: 
IVIFGEN_VAL_TRIGGER_SOURCE_NONE - No trigger source
   O�-   �  �    Instrument Handle                P9#����  �    Status                           WU =  �  �    Channel Name                     [8 =| � �    Trigger Slope                    \� = � � �    Trigger Source                         	           ""               nPositive IVIFGEN_VAL_TRIGGER_POSITIVE Negative IVIFGEN_VAL_TRIGGER_NEGATIVE Either IVIFGEN_VAL_TRIGGER_EITHER            /  {None IVIFGEN_VAL_TRIGGER_SOURCE_NONE Immediate IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL Software IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIFGEN_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIFGEN_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIFGEN_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIFGEN_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIFGEN_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIFGEN_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIFGEN_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIFGEN_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIFGEN_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIFGEN_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIFGEN_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIFGEN_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIFGEN_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIFGEN_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIFGEN_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIFGEN_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIFGEN_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIFGEN_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIFGEN_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIFGEN_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIFGEN_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIFGEN_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIFGEN_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIFGEN_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI1 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6   \    This function configures the attributes that control the function generator's resume trigger. These attributes are the resume trigger source and slope.

A resume trigger resumes generation after it has been paused by a hold trigger, starting with the next point.

Note:

(1) This function is part of the IviFgenResumeTrigger [RT] extension group.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Specifies the slope of the resume trigger. The driver sets the IVIFGEN_ATTR_RESUME_TRIGGER_SLOPE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
IVIFGEN_VAL_TRIGGER_NEGATIVE - Triggers on a negative slope.
IVIFGEN_VAL_TRIGGER_EITHER   - Triggers on either a positive or negative slope.

Default: 
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
    �    Specifies the source of the resume trigger. The driver sets the IVIFGEN_ATTR_RESUME_TRIGGER_SOURCE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_SOURCE_NONE      - No trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately
IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL  - External trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL  - Internal trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE  - Software trigger 
IVIFGEN_VAL_TRIGGER_SOURCE_LAN0      - LAN0
IVIFGEN_VAL_TRIGGER_SOURCE_LAN1      - LAN1
IVIFGEN_VAL_TRIGGER_SOURCE_LAN2      - LAN2
IVIFGEN_VAL_TRIGGER_SOURCE_LAN3      - LAN3
IVIFGEN_VAL_TRIGGER_SOURCE_LAN4      - LAN4
IVIFGEN_VAL_TRIGGER_SOURCE_LAN5      - LAN5
IVIFGEN_VAL_TRIGGER_SOURCE_LAN6      - LAN6
IVIFGEN_VAL_TRIGGER_SOURCE_LAN7      - LAN7
IVIFGEN_VAL_TRIGGER_SOURCE_LXI0      - LXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_LXI1      - LXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_LXI2      - LXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_LXI3      - LXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_LXI4      - LXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_LXI5      - LXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_LXI6      - LXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_LXI7      - LXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_TTL0      - TTL Interface 0
IVIFGEN_VAL_TRIGGER_SOURCE_TTL1      - TTL Interface 1
IVIFGEN_VAL_TRIGGER_SOURCE_TTL2      - TTL Interface 2
IVIFGEN_VAL_TRIGGER_SOURCE_TTL3      - TTL Interface 3
IVIFGEN_VAL_TRIGGER_SOURCE_TTL4      - TTL Interface 4
IVIFGEN_VAL_TRIGGER_SOURCE_TTL5      - TTL Interface 5
IVIFGEN_VAL_TRIGGER_SOURCE_TTL6      - TTL Interface 6
IVIFGEN_VAL_TRIGGER_SOURCE_TTL7      - TTL Interface 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR  - PXI Star Interface
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA 
                                     - PXI Express DStar Line A
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB 
                                     - PXI Express DStar Line B
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC 
                                     - PXI Express DStar Line C
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI0     - RTSI Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1     - RTSI Bus Line 1 
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2     - RTSI Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3     - RTSI Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4     - RTSI Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5     - RTSI Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6     - RTSI Bus Line 6

Default: 
IVIFGEN_VAL_TRIGGER_SOURCE_NONE - No trigger source
   sL-   �  �    Instrument Handle                t#����  �    Status                           { =  �  �    Channel Name                      =| � �    Trigger Slope                    �� = � � �    Trigger Source                         	           ""               nPositive IVIFGEN_VAL_TRIGGER_POSITIVE Negative IVIFGEN_VAL_TRIGGER_NEGATIVE Either IVIFGEN_VAL_TRIGGER_EITHER            /  {None IVIFGEN_VAL_TRIGGER_SOURCE_NONE Immediate IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL Software IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIFGEN_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIFGEN_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIFGEN_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIFGEN_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIFGEN_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIFGEN_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIFGEN_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIFGEN_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIFGEN_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIFGEN_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIFGEN_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIFGEN_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIFGEN_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIFGEN_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIFGEN_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIFGEN_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIFGEN_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIFGEN_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIFGEN_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIFGEN_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIFGEN_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIFGEN_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIFGEN_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIFGEN_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI1 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6   ~    This function configures the attributes that control the function generator's advance trigger. These attributes are the advance trigger source and slope.

An advance trigger advances generation to the end of the current waveform, where generation proceeds according to the current configuration.

Note:

(1) This function is part of the IviFgenAdvanceTrigger [AT] extension group.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Specifies the slope of the advance trigger. The driver sets the IVIFGEN_ATTR_ADVANCE_TRIGGER_SLOPE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
IVIFGEN_VAL_TRIGGER_NEGATIVE - Triggers on a negative slope.
IVIFGEN_VAL_TRIGGER_EITHER   - Triggers on either a positive or negative slope.

Default: 
IVIFGEN_VAL_TRIGGER_POSITIVE - Triggers on a positive slope.
    �    Specifies the source of the advance trigger. The driver sets the IVIFGEN_ATTR_ADVANCE_TRIGGER_SOURCE attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_SOURCE_NONE      - No trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately
IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL  - External trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL  - Internal trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE  - Software trigger 
IVIFGEN_VAL_TRIGGER_SOURCE_LAN0      - LAN0
IVIFGEN_VAL_TRIGGER_SOURCE_LAN1      - LAN1
IVIFGEN_VAL_TRIGGER_SOURCE_LAN2      - LAN2
IVIFGEN_VAL_TRIGGER_SOURCE_LAN3      - LAN3
IVIFGEN_VAL_TRIGGER_SOURCE_LAN4      - LAN4
IVIFGEN_VAL_TRIGGER_SOURCE_LAN5      - LAN5
IVIFGEN_VAL_TRIGGER_SOURCE_LAN6      - LAN6
IVIFGEN_VAL_TRIGGER_SOURCE_LAN7      - LAN7
IVIFGEN_VAL_TRIGGER_SOURCE_LXI0      - LXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_LXI1      - LXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_LXI2      - LXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_LXI3      - LXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_LXI4      - LXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_LXI5      - LXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_LXI6      - LXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_LXI7      - LXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_TTL0      - TTL Interface 0
IVIFGEN_VAL_TRIGGER_SOURCE_TTL1      - TTL Interface 1
IVIFGEN_VAL_TRIGGER_SOURCE_TTL2      - TTL Interface 2
IVIFGEN_VAL_TRIGGER_SOURCE_TTL3      - TTL Interface 3
IVIFGEN_VAL_TRIGGER_SOURCE_TTL4      - TTL Interface 4
IVIFGEN_VAL_TRIGGER_SOURCE_TTL5      - TTL Interface 5
IVIFGEN_VAL_TRIGGER_SOURCE_TTL6      - TTL Interface 6
IVIFGEN_VAL_TRIGGER_SOURCE_TTL7      - TTL Interface 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR  - PXI Star Interface
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA 
                                     - PXI Express DStar Line A
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB 
                                     - PXI Express DStar Line B
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC 
                                     - PXI Express DStar Line C
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI0     - RTSI Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1     - RTSI Bus Line 1 
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2     - RTSI Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3     - RTSI Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4     - RTSI Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5     - RTSI Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6     - RTSI Bus Line 6

Default: 
IVIFGEN_VAL_TRIGGER_SOURCE_NONE - No trigger source
   �@-   �  �    Instrument Handle                ��#����  �    Status                           � =  �  �    Channel Name                     �� =| � �    Trigger Slope                    �� = � � �    Trigger Source                         	           ""               nPositive IVIFGEN_VAL_TRIGGER_POSITIVE Negative IVIFGEN_VAL_TRIGGER_NEGATIVE Either IVIFGEN_VAL_TRIGGER_EITHER            /  {None IVIFGEN_VAL_TRIGGER_SOURCE_NONE Immediate IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL Software IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIFGEN_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIFGEN_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIFGEN_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIFGEN_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIFGEN_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIFGEN_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIFGEN_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIFGEN_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIFGEN_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIFGEN_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIFGEN_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIFGEN_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIFGEN_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIFGEN_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIFGEN_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIFGEN_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIFGEN_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIFGEN_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIFGEN_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIFGEN_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIFGEN_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIFGEN_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIFGEN_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIFGEN_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI1 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6    �    This function configures the rate at which the function generator's internal trigger source generates trigger signals.

Notes:

(1) This function is part of the IviFgenInternalTrigger [IT] extension group.
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Pass the rate at which you want the function generator's internal trigger source to produce a trigger.  The driver uses this value to set the IVIFGEN_ATTR_INTERNAL_TRIGGER_RATE attribute.  The units are Triggers-per-second.

Default Value:  None
   ��-   �  �    Instrument Handle                �A#����  �    Status                           �] = � �  �    Rate                                   	                  This function configures the burst count.  When the function generator receives a trigger while in the Burst operation mode, it generates the number of waveform cycles you specify in the Count parameter.

Notes:

(1) This function is part of the IviFgenBurst [BST] extension group.
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    R    Pass the number of waveform cycles you want the function generator to produce after it receives a trigger.  The driver uses this value to set the IVIFGEN_ATTR_BURST_COUNT attribute. 

For standard and arbitrary waveforms, a cycle is one period of the waveform.

An arbitrary sequence consists of multiple arbitrary waveforms in a sequence.  Each waveform can be repeated a discrete number of times before the next waveform is produced.  For arbitrary sequences, a cycle is one complete progression through the generation of all iterations of all waveforms in the sequence.

Default Value:  1
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   �4-   �  �    Instrument Handle                ��#����  �    Status                           � <4 �  �    Count                            �a =  �  �    Channel Name                           	           1    ""    �    This function configures the common data marker attributes. 
These attributes are the data marker source channel, bit position, and destination.
  
Note:

(1) This function is part of the IviFgenDataMarker [DM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Specifies the channel whose data bit will be returned as a marker. The driver sets the IVIFGEN_ATTR_DATAMARKER_SOURCE_CHANNEL attribute to this value.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the source channel as a string variable or as a literal enclosed in double quotes.
     �    Pass the bit position of the waveform data bit to return as a data marker. A value of 0 indicates the least significant bit. The driver sets the IVIFGEN_ATTR_DATAMARKER_BIT_POSITION attribute to this value.

Default Value:  None
    �    Pass the name of data marker to configure.

A data marker name is a repeated capability identifier defined by specific drivers for the data marker that corresponds to a specified index. The name uniquely identifies a data marker in the data markers collection.

Call the IviFgen_GetDataMarkerName function to get the marker name for the data marker that corresponds to a one-based index.

Users who want to achieve interchangeability should use a virtual data marker name. The virtual data marker name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical data marker name.

Default Value: ""

Note: You can specify the marker name as a string variable or as a literal enclosed in double quotes.
    �    Specifies the destination terminal for the data marker. The driver sets the IVIFGEN_ATTR_DATAMARKER_DESTINATION attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_SOURCE_NONE      - No trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately
IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL  - External trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL  - Internal trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE  - Software trigger 
IVIFGEN_VAL_TRIGGER_SOURCE_LAN0      - LAN0
IVIFGEN_VAL_TRIGGER_SOURCE_LAN1      - LAN1
IVIFGEN_VAL_TRIGGER_SOURCE_LAN2      - LAN2
IVIFGEN_VAL_TRIGGER_SOURCE_LAN3      - LAN3
IVIFGEN_VAL_TRIGGER_SOURCE_LAN4      - LAN4
IVIFGEN_VAL_TRIGGER_SOURCE_LAN5      - LAN5
IVIFGEN_VAL_TRIGGER_SOURCE_LAN6      - LAN6
IVIFGEN_VAL_TRIGGER_SOURCE_LAN7      - LAN7
IVIFGEN_VAL_TRIGGER_SOURCE_LXI0      - LXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_LXI1      - LXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_LXI2      - LXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_LXI3      - LXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_LXI4      - LXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_LXI5      - LXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_LXI6      - LXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_LXI7      - LXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_TTL0      - TTL Interface 0
IVIFGEN_VAL_TRIGGER_SOURCE_TTL1      - TTL Interface 1
IVIFGEN_VAL_TRIGGER_SOURCE_TTL2      - TTL Interface 2
IVIFGEN_VAL_TRIGGER_SOURCE_TTL3      - TTL Interface 3
IVIFGEN_VAL_TRIGGER_SOURCE_TTL4      - TTL Interface 4
IVIFGEN_VAL_TRIGGER_SOURCE_TTL5      - TTL Interface 5
IVIFGEN_VAL_TRIGGER_SOURCE_TTL6      - TTL Interface 6
IVIFGEN_VAL_TRIGGER_SOURCE_TTL7      - TTL Interface 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR  - PXI Star Interface
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA 
                                     - PXI Express DStar Line A
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB 
                                     - PXI Express DStar Line B
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC 
                                     - PXI Express DStar Line C
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI0     - RTSI Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1     - RTSI Bus Line 1 
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2     - RTSI Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3     - RTSI Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4     - RTSI Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5     - RTSI Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6     - RTSI Bus Line 6

Default: 
IVIFGEN_VAL_TRIGGER_SOURCE_NONE - No trigger source
   �"#����  �    Status                           �>-   �  �    Instrument Handle                �� > � �  �    Source Channel                   �� >} �  �    Bit Position                     �� >  �  �    Marker Name                      �� �  � �    Destination Terminal               	               ""        ""            /  {None IVIFGEN_VAL_TRIGGER_SOURCE_NONE Immediate IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL Software IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIFGEN_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIFGEN_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIFGEN_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIFGEN_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIFGEN_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIFGEN_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIFGEN_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIFGEN_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIFGEN_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIFGEN_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIFGEN_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIFGEN_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIFGEN_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIFGEN_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIFGEN_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIFGEN_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIFGEN_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIFGEN_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIFGEN_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIFGEN_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIFGEN_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIFGEN_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIFGEN_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIFGEN_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI1 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6   �    This function returns the repeated capability identifier for the data marker that corresponds to the one-based index that you specify. If the value you specify for the index parameter is less than one or greater than the value of the data marker count, the function returns an empty string in the name parameter and returns an error.

Note:

(1) This function is part of the IviFgenDataMarker [DM] extension group.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     �    A one-based index that defines which marker name to return.

Valid values for the markerIndex parameter are between one and the value of the IVIFGEN_ATTR_DATAMARKER_COUNT attribute, inclusive. 

Default Value:  1
     l    Returns the marker name of the data marker that is in the data marker collection at the index you specify.    �    Pass the number of bytes in the ViChar array that the you for the markerName parameter.

If the marker name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies nameBufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the nameBufferSize is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the markerName parameter.

Default Value:  None   �_-   �  �    Instrument Handle                �#����  �    Status                           �� = 0 �  �    Marker Index                     �� �1 �  �    Marker Name                        � . �  �    Name Buffer Size                       	           1    	                �    Disables all of the data markers by setting their data marker destination attribute to None.

Notes:

(1) This function is part of the IviFgenDataMarker [DM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           �-   �  �    Instrument Handle                  	              ;    This function configures the common sparse marker attributes. These attributes are the sparse marker waveform handle and destination.
 
This function also configures which waveform and sample number the output is associated with.

Note:

(1) This function is part of the IviFgenSparseMarker [SM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the handle of the waveform whose indexes the sparse marker refers to. The driver sets the IVIFGEN_ATTR_SPARSEMARKER_WFMHANDLE attribute to this value. 

You create an arbitrary waveform using following functions:

-  IviFgen_CreateArbWaveform
-  IviFgen_CreateChannelArbWaveform
-  IviFgen_CreateChannelArbWaveform16
-  IviFgen_CreateChannelArbWaveform32

These functions return a handle that you use to identify the waveform.

Default Value: None
     ]    Pass the number of elements provided in the indexesArray parameter. 

Default Value:  None
        Pass the name of the sparse marker to configure.

A sparse marker name is a repeated capability identifier defined by specific drivers for the sparse marker that corresponds to a specified index. The name uniquely identifies a sparse marker in the sparse markers collection.

Call the IviFgen_GetSparseMarkerName function to get the marker name for the sparse marker that corresponds to a one-based index.

Users who want to achieve interchangeability should use a virtual sparse marker name. The virtual sparse marker name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical sparse marker name.

Default Value: ""

Note: You can specify the marker name as a string variable or as a literal enclosed in double quotes.
     �    Pass the array of the sample numbers of the specified waveform on which markers are output. These indexes may be coerced by the driver. Use the IviFgen_GetSparseMarkerIndexes function to find the coerced values.

Default Value:  None
    �    Specifies the destination terminal for the sparse marker. The driver sets the IVIFGEN_ATTR_SPARSEMARKER_DESTINATION attribute to this value. 

Valid Values:
IVIFGEN_VAL_TRIGGER_SOURCE_NONE      - No trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately
IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL  - External trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL  - Internal trigger source
IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE  - Software trigger 
IVIFGEN_VAL_TRIGGER_SOURCE_LAN0      - LAN0
IVIFGEN_VAL_TRIGGER_SOURCE_LAN1      - LAN1
IVIFGEN_VAL_TRIGGER_SOURCE_LAN2      - LAN2
IVIFGEN_VAL_TRIGGER_SOURCE_LAN3      - LAN3
IVIFGEN_VAL_TRIGGER_SOURCE_LAN4      - LAN4
IVIFGEN_VAL_TRIGGER_SOURCE_LAN5      - LAN5
IVIFGEN_VAL_TRIGGER_SOURCE_LAN6      - LAN6
IVIFGEN_VAL_TRIGGER_SOURCE_LAN7      - LAN7
IVIFGEN_VAL_TRIGGER_SOURCE_LXI0      - LXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_LXI1      - LXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_LXI2      - LXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_LXI3      - LXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_LXI4      - LXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_LXI5      - LXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_LXI6      - LXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_LXI7      - LXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_TTL0      - TTL Interface 0
IVIFGEN_VAL_TRIGGER_SOURCE_TTL1      - TTL Interface 1
IVIFGEN_VAL_TRIGGER_SOURCE_TTL2      - TTL Interface 2
IVIFGEN_VAL_TRIGGER_SOURCE_TTL3      - TTL Interface 3
IVIFGEN_VAL_TRIGGER_SOURCE_TTL4      - TTL Interface 4
IVIFGEN_VAL_TRIGGER_SOURCE_TTL5      - TTL Interface 5
IVIFGEN_VAL_TRIGGER_SOURCE_TTL6      - TTL Interface 6
IVIFGEN_VAL_TRIGGER_SOURCE_TTL7      - TTL Interface 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR  - PXI Star Interface
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6
IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA 
                                     - PXI Express DStar Line A
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB 
                                     - PXI Express DStar Line B
IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC 
                                     - PXI Express DStar Line C
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI0     - RTSI Bus Line 0
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1     - RTSI Bus Line 1 
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2     - RTSI Bus Line 2
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3     - RTSI Bus Line 3
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4     - RTSI Bus Line 4
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5     - RTSI Bus Line 5
IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6     - RTSI Bus Line 6

Default: 
IVIFGEN_VAL_TRIGGER_SOURCE_NONE - No trigger source
   b#����  �    Status                           ~-   �  �    Instrument Handle                5 > � �  �    Waveform Handle                   >{ �  �    Number Indexes                   i >  �  �    Marker Name                      u �  �  �    Indexes Array                    i � � � �    Destination Terminal               	                       ""                /  {None IVIFGEN_VAL_TRIGGER_SOURCE_NONE Immediate IVIFGEN_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIFGEN_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIFGEN_VAL_TRIGGER_SOURCE_INTERNAL Software IVIFGEN_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIFGEN_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIFGEN_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIFGEN_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIFGEN_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIFGEN_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIFGEN_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIFGEN_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIFGEN_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIFGEN_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIFGEN_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIFGEN_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIFGEN_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIFGEN_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIFGEN_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIFGEN_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIFGEN_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIFGEN_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIFGEN_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIFGEN_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIFGEN_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIFGEN_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIFGEN_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIFGEN_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIFGEN_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIFGEN_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIFGEN_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIFGEN_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI1 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIFGEN_VAL_TRIGGER_SOURCE_RTSI6   �    This function returns the repeated capability identifier for the sparse marker that corresponds to the one-based index that you specify. If the value that you passe for the markerIndex parameter is less than one or greater than the value of the data marker count, the function returns an empty string in the markerName parameter and returns an error.

Note:

(1) This function is part of the IviFgenSparseMarker [SM] extension group     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     �    A one-based index that defines which marker name to return.

Valid values for the this parameter are between one and the value of the IVIFGEN_ATTR_SPARSEMARKER_COUNT attribute, inclusive. 

Default Value:  1
     o    Returns the marker name of the sparse marker that is in the sparse maker collection at the index you specify.    �    Pass the number of bytes in the ViChar array that you specify for the markerName parameter.

If the marker name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies nameBufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the nameBufferSize is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the markerName parameter.

Default Value:  None   3?-   �  �    Instrument Handle                3�#����  �    Status                           8� = 0 �  �    Marker Index                     9y �1 �  �    Marker Name                      9� � . �  �    Name Buffer Size                       	           1    	                   This function returns the coerced indexes associated with the sparse marker. You can use following functions to specify indexes:

-  IviFgen_ConfigureSparseMarker
-  IviFgen_SetSparseMarkerIndexes

Note:

(1) This function is part of the IviFgenSparseMarker [SM] extension group.
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     ?    Returns the number of elements in the indexesArray parameter.     V    Specifies the size of the indexesArray parameter in elements.

Default Value:  None
    *    Pass the name of the sparse marker associated with the coerced indexes you want to get.

A sparse marker name is a repeated capability identifier defined by specific drivers for the sparse marker that corresponds to a specified index. The name uniquely identifies a sparse marker in the sparse markers collection.

Call the IviFgen_GetSparseMarkerName function to get the marker name for the sparse marker that corresponds to a one-based index.

Users who want to achieve interchangeability should use a virtual sparse marker name. The virtual sparse marker name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical sparse marker name.

Default Value: ""

Note: You can specify the marker name as a string variable or as a literal enclosed in double quotes.     P    Returns the sample numbers on which markers are output.

Default Value:  None
   ?-   �  �    Instrument Handle                ?�#����  �    Status                           D} �u �  �    Indexes Actual Size              D� >u �  �    Indexes Array Size               E" >  �  �    Marker Name                      HT �  �  �    Indexes Array                          	           	                ""    	               This function sets the indexes associated with the sparse marker.  These indexes may be coerced by the driver.  Use the IviFgen_GetSparseMarkerIndexes function to find the coerced values.

Note:

(1) This function is part of the IviFgenSparseMarker [SM] extension group.

     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     V    Specifies the size of the indexesArray parameter in elements.

Default Value:  None
     R    Specifies the sample numbers on which markers are output.

Default Value:  None
    *    Pass the name of the sparse marker associated with the coerced indexes you want to get.

A sparse marker name is a repeated capability identifier defined by specific drivers for the sparse marker that corresponds to a specified index. The name uniquely identifies a sparse marker in the sparse markers collection.

Call the IviFgen_GetSparseMarkerName function to get the marker name for the sparse marker that corresponds to a one-based index.

Users who want to achieve interchangeability should use a virtual sparse marker name. The virtual sparse marker name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical sparse marker name.

Default Value: ""

Note: You can specify the marker name as a string variable or as a literal enclosed in double quotes.   K6-   �  �    Instrument Handle                K�#����  �    Status                           P� > � �  �    Indexes Array Size               P� >~ �  �    Indexes Array                    QN >  �  �    Marker Name                            	                   ""    �    Disables all of the sparse markers by setting their Sparse Marker Destination attribute to None.

Note:

(1) This function is part of the IviFgenSparseMarker [SM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   Ve#����  �    Status                           ]�-   �  �    Instrument Handle                  	              '    This function specifies whether the function generator applies amplitude modulation to the signal that the function generator produces with the IviFgenStdFunc, IviFgenArbWfm, or IviFgenArbSeq capability groups.

Notes:

(1) This function is part of the IviFgenModulateAM [AM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass whether you want the function generator to apply amplitude modulation to a channel.  The driver uses this value to set the IVIFGEN_ATTR_AM_ENABLED attribute.

Valid Values:
VI_TRUE  - AM Enabled
VI_FALSE - AM Disabled

Default Value: VI_FALSE
   _�#����  �    Status                           f�-   �  �    Instrument Handle                g� =  �  �    Channel Name                     k� = � �  �    AM Enabled                         	               ""    True VI_TRUE False VI_FALSE    �    This function configures the source of the signal the function generator uses to apply amplitude modulation to the channel.

Notes:

(1) This function is part of the IviFgenModulateAM [AM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    :    Pass the source of the modulating signal you want to use. The driver sets the IVIFGEN_ATTR_AM_SOURCE attribute to this value. 

Valid Values:
IVIFGEN_VAL_AM_INTERNAL - internal modulation source
IVIFGEN_VAL_AM_EXTERNAL - external modulation source

Default: 
IVIFGEN_VAL_AM_INTERNAL - internal modulation source
   nz#����  �    Status                           u�-   �  �    Instrument Handle                vM =  �  �    Channel Name                     z0 = � � �    Source                             	               ""               BInternal IVIFGEN_VAL_AM_INTERNAL External IVIFGEN_VAL_AM_EXTERNAL       This function configures the attributes that control the function generator's internal amplitude modulation source.  These attributes are the modulation depth, waveform, and frequency.

Notes:

(1) This function is part of the IviFgenModulateAM [AM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Pass the waveform you want to use to modulate the output signal.  The driver sets the IVIFGEN_ATTR_AM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
IVIFGEN_VAL_AM_INTERNAL_SINE      - Sinusoid waveform 
IVIFGEN_VAL_AM_INTERNAL_SQUARE    - Square waveform 
IVIFGEN_VAL_AM_INTERNAL_TRIANGLE  - Triangle waveform
IVIFGEN_VAL_AM_INTERNAL_RAMP_UP   - Positive ramp waveform
IVIFGEN_VAL_AM_INTERNAL_RAMP_DOWN - Negative ramp waveform

Default Value:
IVIFGEN_VAL_AM_INTERNAL_SINE      - Sinusoid waveform 
     �    Pass the frequency at which you want the instrument to generate the modulating waveform. The driver sets the IVIFGEN_ATTR_AM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Default Value: None    h    Pass the percentage of full modulation you want to apply to the carrier signal. The driver sets the IVIFGEN_ATTR_AM_INTERNAL_DEPTH attribute to this value. At 0% depth, the output amplitude equals the carrier signal's amplitude. At 100% depth, the output amplitude equals twice the the carrier signal's amplitude.

Units: Percentage (%)

Default Value: None
   }�#����  �    Status                           ��-   �  �    Instrument Handle                �� = � � �    Modulation Waveform              �� =� �  �    Modulation Frequency             �| =  �  �    Modulation Depth                   	                          �Sine IVIFGEN_VAL_AM_INTERNAL_SINE Square IVIFGEN_VAL_AM_INTERNAL_SQUARE Triangle IVIFGEN_VAL_AM_INTERNAL_TRIANGLE Ramp Up IVIFGEN_VAL_AM_INTERNAL_RAMP_UP Ramp Down IVIFGEN_VAL_AM_INTERNAL_RAMP_DOWN           '    This function specifies whether the function generator applies frequency modulation to the signal that the function generator produces with the IviFgenStdFunc, IviFgenArbWfm, or IviFgenArbSeq capability groups.

Notes:

(1) This function is part of the IviFgenModulateFM [FM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
         
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass whether you want the function generator to apply frequency modulation to a channel.  The driver uses this value to set the IVIFGEN_ATTR_FM_ENABLED attribute.

Valid Values:
VI_TRUE  - FM Enabled
VI_FALSE - FM Disabled

Default Value: VI_FALSE
   �#����  �    Status                           �,-   �  �    Instrument Handle                �� =  �  �    Channel Name                     �� : � �  �    FM Enabled                         	               ""    True VI_TRUE False VI_FALSE    �    This function configures the source of the signal the function generator uses to apply frequency modulation to the channel.

Notes:

(1) This function is part of the IviFgenModulateFM [FM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    :    Pass the source of the modulating signal you want to use. The driver sets the IVIFGEN_ATTR_FM_SOURCE attribute to this value. 

Valid Values:
IVIFGEN_VAL_FM_INTERNAL - internal modulation source
IVIFGEN_VAL_FM_EXTERNAL - external modulation source

Default: 
IVIFGEN_VAL_FM_INTERNAL - internal modulation source
   ��#����  �    Status                           ��-   �  �    Instrument Handle                �| =  �  �    Channel Name                     �_ = � � �    Source                             	               ""               BInternal IVIFGEN_VAL_FM_INTERNAL External IVIFGEN_VAL_FM_EXTERNAL       This function configures the attributes that control the function generator's internal frequency modulation source.  These attributes are the peak deviation, waveform, and frequency.

Notes:

(1) This function is part of the IviFgenModulateFM [FM] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Pass the waveform you want to use to modulate the output signal.  The driver sets the IVIFGEN_ATTR_FM_INTERNAL_WAVEFORM attribute to this value.
  
Defined Values:
IVIFGEN_VAL_FM_INTERNAL_SINE      - Sinusoid waveform
IVIFGEN_VAL_FM_INTERNAL_SQUARE    - Square waveform 
IVIFGEN_VAL_FM_INTERNAL_TRIANGLE  - Triangle waveform
IVIFGEN_VAL_FM_INTERNAL_RAMP_UP   - Positive ramp waveform
IVIFGEN_VAL_FM_INTERNAL_RAMP_DOWN - Negative ramp waveform

Default Value:
IVIFGEN_VAL_FM_INTERNAL_SINE      - Sinusoid waveform

    5    Pass the maximum frequency deviation you want the function generator to apply to the carrier waveform. This deviation corresponds to the maximum amplitude level of the modulating signal. The driver sets the IVIFGEN_ATTR_FM_INTERNAL_DEVIATION attribute to this value.

Units: Hertz (Hz)

Default Value: None
     �    Specifies the frequency of the internal modulating signal. The driver sets the IVIFGEN_ATTR_FM_INTERNAL_FREQUENCY attribute to this value.

Units: Hertz (Hz)

Default Value: None   ��#����  �    Status                           �-   �  �    Instrument Handle                �� = � � �    Modulation Waveform              �� = " �  �    Peak Deviation                   � =� �  �    Modulation Frequency               	                          �Sine IVIFGEN_VAL_FM_INTERNAL_SINE Square IVIFGEN_VAL_FM_INTERNAL_SQUARE Triangle IVIFGEN_VAL_FM_INTERNAL_TRIANGLE Ramp Up IVIFGEN_VAL_FM_INTERNAL_RAMP_UP Ramp Down IVIFGEN_VAL_FM_INTERNAL_RAMP_DOWN           �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    G    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   ��-   �  �    Instrument Handle                �]#����  �    Status                           �y � � �  �    Attribute Value                 ���� � ���                                          ǜ = � � �    Attribute ID                     �� =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViInt64 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    G    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   � -   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                  � = � � �    Attribute ID                     �e =  �  �    Channel Name                           	                           0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    J    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64 
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   �4-   �  �    Instrument Handle                ��#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          �* = � � �    Attribute ID                     | =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    J    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString 
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   �-   �  �    Instrument Handle                f#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     � =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    I    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   '.-   �  �    Instrument Handle                '�#����  �    Status                           / � � �  �    Attribute Value                 ���� � ���                                          1$ = � � �    Attribute ID                     6u =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    J    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   A�-   �  �    Instrument Handle                Bb#����  �    Status                           I~ � � �  �    Attribute Value                  K� =  �  �    Channel Name                     PR = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute. Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <Enter>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   Y)-   �  �    Instrument Handle                Y�#����  �    Status                           `� � � �  �    Attribute Value                  b� =  �  �    Channel Name                     gj = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViInt64 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute. Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <Enter>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   o9-   �  �    Instrument Handle                o�#����  �    Status                           w � � �  �    Attribute Value                  x� =  �  �    Channel Name                     }z = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute. Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <Enter>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   �J-   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                  �� =  �  �    Channel Name                     �� = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value. You pass the number of bytes in the buffer as the Buffer Size parameter. If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the number of bytes in the value, pass a negative number for the Buffer Size parameter.

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviFgen_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    #    The buffer in which the function returns the current value of the attribute. The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value:  512    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <Enter>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   �j-   �  �    Instrument Handle                �!#����  �    Status or Required Size          �� � L � �    Attribute Value                  �% =  �  �    Channel Name                     �� =� �  �    Buffer Size                      �� = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute. Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <Enter>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   ��-   �  �    Instrument Handle                ��#����  �    Status                           ŭ � � �  �    Attribute Value                  �l =  �  �    Channel Name                     � = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
         
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute. Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  
    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <Enter>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   ��-   �  �    Instrument Handle                Ԫ#����  �    Status                           �� � � �  �    Attribute Value                  ݄ =  �  �    Channel Name                     �5 = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    H    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Any attribute 
  whose value cannot be set is dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type.
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   �w-   �  �    Instrument Handle                �.#����  �    Status                           �J � � �  �    Attribute Value                  � =  �  �    Channel Name                    ���� � ���                                          �3 = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    S    This function checks the validity of a value you specify for a ViInt64 attribute.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    H    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Any attribute 
  whose value cannot be set is dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type.
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   �y-   �  �    Instrument Handle                �0#����  �    Status                           L � � �  �    Attribute Value                  � =  �  �    Channel Name                     5 = � � �    Attribute ID                           	               ""                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    J    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Any attribute 
  whose value cannot be set is dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   -   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                  ! =  �  �    Channel Name                    ���� � ���                                          "� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    J    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Any attribute 
  whose value cannot be set is dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   *-   �  �    Instrument Handle                *�#����  �    Status                           1� � � �  �    Attribute Value                  4& =  �  �    Channel Name                    ���� � ���                                          8� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    K    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Any attribute 
  whose value cannot be set is dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   @!-   �  �    Instrument Handle                @�#����  �    Status                           G� � � �  �    Attribute Value                  J, =  �  �    Channel Name                    ���� � ���                                          N� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    0    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows:

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <Enter> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <Enter>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: None    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to set the value of the attribute. If the attribute is not channel-based, then pass VI_NULL or an empty string.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    K    Pass the ID of an attribute.

From the function panel window, you can use this control as follows:

- Click on the control or press <Enter>, <Spacebar>, or
  <Ctrl-Down Arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Any attribute 
  whose value cannot be set is dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <Enter>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type. If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <Ctrl-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <Enter>.
   V(-   �  �    Instrument Handle                V�#����  �    Status                           ]� � � �  �    Attribute Value                  `3 =  �  �    Channel Name                    ���� � ���                                          d� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0   �    This function aborts a previously initiated signal generation. If the function generator is in the Output Generation State, this function moves the function generator to the Configuration State.  If the function generator is already in the Configuration State, the function does nothing and returns VI_SUCCESS.

You can configure the output of the function generator regardless of whether the function generator is in the Configuration State or the Generation State.  This means that you are not required to call the IviFgen_AbortGeneration function prior to configuring the output of the function generator.  

Many function generators constantly generate an output signal, and do not require you to abort signal generation prior to configuring the instrument.  If a function generator's output cannot be aborted (i.e., the function generator cannot stop generating a signal) this function does nothing and returns VI_SUCCESS.

You are not required to call the IviFgen_InitiateGeneration and IviFgen_AbortGeneration functions.  Whether you choose to call these functions in an application program has no impact on interchangeability.  You can choose to use these functions if you want to optimize your application for instruments that exhibit increased performance when output configuration is performed while the instrument is not generating a signal.

Note: This function does not normally check the instrument status.  Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviFgen_error_query function at the conclusion of the sequence.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   r�#����  �    Status                           y�-   �  �    Instrument Handle                  	              *    This function initiates signal generation. If the function generator is in the Configuration State, this function moves the function generator to the Output Generation State.  If the function generator is already in the Output Generation State, this function does nothing and returns VI_SUCCESS.

The instrument is in the Generation State after you call the IviFgen_init, IviFgen_InitWithOptions, or IviFgen_reset functions.  You can configure the output of the function generator regardless of whether function generator is in the Configuration State or the Generation State.  This means that you are required to call the IviFgen_InitiateGeneration function only if you abort signal generation by calling the IviFgen_AbortGeneration function.  

Many function generators constantly generate an output signal, and do not require you to initiate signal generation.  If a function generator is always outputting the currently configured signal, this function does nothing and returns VI_SUCCESS.

You are not required to call the IviFgen_InitiateGeneration and IviFgen_AbortGeneration functions.  Whether you choose to call these functions in an application program has no impact on interchangeability.  You can choose to use these functions if you want to optimize your application for instruments that exhibit increased performance when output configuration is performed while the instrument is not generating a signal.

This function disables extensions that have not been set by the user under the following conditions:

(1) If you have not set the value of any attribute in the IviFgenModulateAM extension on a channel, this function sets the IVIFGEN_ATTR_AM_ENABLED attribute to VI_FALSE for that channel.

(2) If you have not set the value of any attribute in the IviFgenModulateFM extension on a channel, this function sets the IVIFGEN_ATTR_FM_ENABLED attribute to VI_FALSE for that channel.

Notes:

(1) This function does not normally check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviFgen_error_query function at the conclusion of the sequence.

(2) This function performs interchangeability checking when the IVIFGEN_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE. If the IVIFGEN_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings. You use the IviFgen_GetNextInterchangeWarning function to retrieve interchangeability warnings when the IVIFGEN_ATTR_SPY attribute is set to VI_FALSE. For more information about interchangeability checking, refer to the help text for the IVIFGEN_ATTR_INTERCHANGE_CHECK attribute.

        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �L#����  �    Status                           �h-   �  �    Instrument Handle                  	              q    This function sends a software-generated stop trigger to the function generator.  Call this function if you pass IVIFGEN_VAL_SOFTWARE_TRIG for the triggerSource parameter of the IviFgen_ConfigureTriggerSource function.  If the IVIFGEN_ATTR_TRIGGER_SOURCE attribute is not set to IVIFGEN_VAL_SOFTWARE_TRIG, this function returns the error IVIFGEN_ERROR_TRIGGER_NOT_SOFTWARE.

Notes:

(1) This function does not normally check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviFgen_error_query function at the conclusion of the sequence.

(2) This function is part of the IviFgenStopTrigger [SPT] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           �.-   �  �    Instrument Handle                  	              p    This function sends a software-generated hold trigger to the function generator.  Call this function if you pass IVIFGEN_VAL_SOFTWARE_TRIG for the triggerSource parameter of the IviFgen_ConfigureTriggerSource function.  If the IVIFGEN_ATTR_TRIGGER_SOURCE attribute is not set to IVIFGEN_VAL_SOFTWARE_TRIG, this function returns the error IVIFGEN_ERROR_TRIGGER_NOT_SOFTWARE.

Notes:

(1) This function does not normally check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviFgen_error_query function at the conclusion of the sequence.

(2) This function is part of the IviFgenHoldTrigger [HT] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	              s    This function sends a software-generated resume trigger to the function generator. Call this function if you pass IVIFGEN_VAL_SOFTWARE_TRIG for the triggerSource parameter of the IviFgen_ConfigureTriggerSource function.  If the IVIFGEN_ATTR_TRIGGER_SOURCE attribute is not set to IVIFGEN_VAL_SOFTWARE_TRIG, this function returns the error IVIFGEN_ERROR_TRIGGER_NOT_SOFTWARE.

Notes:

(1) This function does not normally check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviFgen_error_query function at the conclusion of the sequence.

(2) This function is part of the IviFgenResumeTrigger [RT] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	              u    This function sends a software-generated advance trigger to the function generator. Call this function if you pass IVIFGEN_VAL_SOFTWARE_TRIG for the triggerSource parameter of the IviFgen_ConfigureTriggerSource function.  If the IVIFGEN_ATTR_TRIGGER_SOURCE attribute is not set to IVIFGEN_VAL_SOFTWARE_TRIG, this function returns the error IVIFGEN_ERROR_TRIGGER_NOT_SOFTWARE.

Notes:

(1) This function does not normally check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviFgen_error_query function at the conclusion of the sequence.

(2) This function is part of the IviFgenAdvanceTrigger [AT] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �i#����  �    Status                           ��-   �  �    Instrument Handle                  	              ^    This function sends a command to trigger the function generator.  Call this function if you pass IVIFGEN_VAL_SOFTWARE_TRIG for the Trigger Source parameter of the IviFgen_ConfigureTriggerSource function.  If the IVIFGEN_ATTR_TRIGGER_SOURCE attribute is not set to IVIFGEN_VAL_SOFTWARE_TRIG, this function returns the error IVIFGEN_ERROR_TRIGGER_NOT_SOFTWARE.

Notes:

(1) This function does not normally check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviFgen_error_query function at the conclusion of the sequence.

(2) This function is part of the IviFgenTrigger [SWT] extension group.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           �8-   �  �    Instrument Handle                  	              %    This function resets the instrument to a known state and sends initialization commands to the instrument. The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   ʖ#����  �    Status                           Ѳ-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �|#����  �    Status                           �$-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self-test routine and returns the test result(s). 

    $    This control contains the value returned from the instrument self-test. Zero means success. For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   ٸ =  �  �    Self Test Result                 �� = � � ,    Self-Test Message                ۮ#����  �    Status                           ��-   �  �    Instrument Handle                  	           	            	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �	#����  �    Status                           �-   �  �    Instrument Handle                  	               P    This function invalidates the cached values of all attributes for the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �;#����  �    Status                           ��-   �  �    Instrument Handle                  	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �} = 3 �  �    Instrument Driver Revision       � =6 �  �    Firmware Revision                �#����  �    Status                           ��-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �� =  �  �    Error Code                       � = � � ,    Error Message                    ��#����  �    Status                           �-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     %v    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
IviFgen Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call IviFgen_error_query.
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
BFFA0047  Attribute must be channel-based.
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
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter. This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   � =  �  h    Error Code                       +e = � � �    Error Message                    , #����  �    Status                           3-   �  �    Instrument Handle                  0    	            	           VI_NULL    `    The function returns the channel string that is in the channel table at an index you specify.
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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

Default Value:  None   5�-   �  �    Instrument Handle                6V#����  �    Status                           :� = 0 �  �    Index                            ;C �. �  �    Channel String                   ;� � . �  �    Buffer Size                            	           1    	                h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     Z    Returns the C session instrument handle you use to call the specific driver's functions.   @L-   �  �    Instrument Handle                A#����  �    Status                           H = � �  �    Specific Driver C Handle               	           	          �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviFgen_GetError or IviFgen_ClearError.
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   M#����  �    Status                           Q�-   �  �    Instrument Handle                Ru =B �  �    BufferSize                       UU = Q �  �    Code                             U� � Q � �    Description                        	                   	           	           a    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the instrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviFgen_GetError function, which occurs when a call to IviFgen_init or IviFgen_InitWithOptions fails.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviFgen_error_message function.  To obtain additional information about the error condition, use the IviFgen_GetError and IviFgen_ClearError functions.

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
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ]�#����  �    Status                           b*-   �  �    Instrument Handle                  	              �    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. If the IVIFGEN_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve interchangeability warnings. If the IVIFGEN_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.

The class driver performs interchangeability checking when the IVIFGEN_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE and you call one of the following functions:

IviFgen_InitiateGeneration()

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for the Interchange Warning buffer parameter.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

Interchangeability checking examines the attributes in a capability group only if you specify a value for at least one attribute within that group. In general, the class driver generates interchangeability warnings when it encounters one of the following conditions:

(1) An attribute that affects the behavior of the instrument is in a state that you did not specify.

(2) You set a class-defined attribute to an instrument-specific value.

(3) You set the value of an attribute that the class driver defines as read-only.

(4) The class driver encounters an error when it tries to apply a value to an extension attribute that your program never configures.

        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   l'#����  �    Status or Required Size          sC-   �  �    Instrument Handle                s� = � �  �    Buffer Size                      v� � Q � �    Interchange Warning                	                   	            �    The specific driver performs interchangeability checking if the IVIFGEN_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   {�-   �  �    Instrument Handle                |�#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviFgen_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviFgen_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviFgen_ClearInterchangeWarnings function.     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   ��-   �  �    Instrument Handle                ��#����  �    Status                                 	          k    This function obtains the coercion information associated with the IVI session. It retrieves and clears the oldest instance in which the specific driver coerced a value you specified to another value.

If you set the IVIFGEN_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the specific driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions. If the IVIFGEN_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve information from that list. If the IVIFGEN_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view the coercion information.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session. If there are no coercion records, the function returns an empty string.

This buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into this buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to this buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for this parameter.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None
   ��#����  �    Status or Required Size          ��-   �  �    Instrument Handle                �� � Q � �    Coercion Record                  �n = � �  �    Buffer Size                        	               	               +    This function obtains a multithread lock on the instrument session. Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviFgen_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviFgen_LockSession returns successfully, no other threads can access the instrument session until you call IviFgen_UnlockSession.

Use IviFgen_LockSession and IviFgen_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviFgen_LockSession within the same thread. To completely unlock the session, you must balance each call to IviFgen_LockSession with a call to IviFgen_UnlockSession. If, however, you use the Caller Has Lock parameter in all calls to IviFgen_LockSession and IviFgen_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviFgen_LockSession.  This allows you to call IviFgen_UnlockSession just once at the end of the function. 
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience. If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable. In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviFgen_LockSession or IviFgen_UnlockSession in the same function.

The parameter is an input/output parameter. IviFgen_LockSession and IviFgen_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviFgen_LockSession does not lock the session again. If the value is VI_FALSE, IviFgen_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviFgen_UnlockSession does not attempt to unlock the session. If the value is VI_TRUE, IviFgen_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviFgen_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviFgen_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviFgen_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviFgen_LockSession(vi, &haveLock);
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
    IviFgen_UnlockSession(vi, &haveLock);
    return error;
}   ��#����  �    Status                           ��-   �  �    Instrument Handle                �\ H � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviFgen_LockSession. Refer to IviFgen_LockSession for additional information on session locks.
        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviFgen_LockSession or IviFgen_UnlockSession in the same function.

The parameter is an input/output parameter.  IviFgen_LockSession and IviFgen_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviFgen_LockSession does not lock the session again.  If the value is VI_FALSE, IviFgen_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviFgen_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviFgen_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviFgen_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviFgen_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviFgen_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviFgen_LockSession(vi, &haveLock);
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
    IviFgen_UnlockSession(vi, &haveLock);
    return error;
}   ��#����  �    Status                           ū-   �  �    Instrument Handle                �b H � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session when you call IviFgen_close.

(2) After calling IviFgen_close, you cannot use the instrument driver again until you call IviFgen_init.

        Returns the status code of this operation. The status code  either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviFgen_error_message function. To obtain additional information about the error condition, call the IviFgen_GetError function. To clear the error information from the driver, call the IviFgen_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2004  The function generator's waveform memory is full.
BFFA2008  The waveform is currently in use.
BFFA2009  The function generator's sequence memory is full.
BFFA200D  The sequence is currently in use.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviFgen_init or IviFgen_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �l#����  �    Status                           ׈-   �  �    Instrument Handle                  	            ����         M�  dP             K.        init                                                                                                                                    ����         e�  �/             K.        InitWithOptions                                                                                                                         ����         �  ��             K.        ConfigureOutputMode                                                                                                                     ����         �(  �O             K.        ConfigureOperationMode                                                                                                                  ����         ��  ��             K.        ConfigureOutputEnabled                                                                                                                  ����         ��  �             K.        ConfigureOutputImpedance                                                                                                                ����         �  �h             K.        ConfigureRefClockSource                                                                                                                 ����         Т  �"             K.        ConfigureSampleClock                                                                                                                    ����         �D  ��             K.        ConfigureSampleClockOutputEnabled                                                                                                       ����         ��  �{             K.        ConfigureStandardWaveform                                                                                                               ����         O             K.        ClearArbWaveform                                                                                                                        ����         �             K.        ConfigureArbWaveform                                                                                                                    ����        � *#             K.        ConfigureSampleRate                                                                                                                     ����        *� 8�             K.        CreateArbWaveform                                                                                                                       ����        9� N�             K.        CreateChannelArbWaveform                                                                                                                ����        P( e�             K.        CreateChannelArbWaveform16                                                                                                              ����        gK }             K.        CreateChannelArbWaveform32                                                                                                              ����        ~n �M             K.        QueryArbWfmCapabilities                                                                                                                 ����        �� ��             K.        QueryArbWfmCapabilities64                                                                                                               ����        �2 ��             K.        ConfigureArbFrequency                                                                                                                   ����        � ��             K.        QueryArbSeqCapabilities                                                                                                                 ����        � �             K.        CreateArbSequence                                                                                                                       ����        �n ��             K.        ConfigureArbSequence                                                                                                                    ����        �' �l             K.        ClearArbSequence                                                                                                                        ����        � ��             K.        ClearArbMemory                                                                                                                          ����        �q �             K.        ConfigureTriggerSource                                                                                                                  ����        v  �             K.        ConfigureStartTrigger                                                                                                                   ����        * D�             K.        ConfigureStopTrigger                                                                                                                    ����        M� h�             K.        ConfigureHoldTrigger                                                                                                                    ����        q� ��             K.        ConfigureResumeTrigger                                                                                                                  ����        �� ��             K.        ConfigureAdvanceTrigger                                                                                                                 ����        �� �]             K.        ConfigureInternalTriggerRate                                                                                                            ����        � �E             K.        ConfigureBurstCount                                                                                                                     ����        �4 ��             K.        ConfigureDataMarker                                                                                                                     ����        �� �             K.        GetDataMarkerName                                                                                                                       ����         �             K.        DisableAllDataMarkers                                                                                                                   ����         (f             K.        ConfigureSparseMarker                                                                                                                   ����        1� <�             K.        GetSparseMarkerName                                                                                                                     ����        =� H�             K.        GetSparseMarkerIndexes                                                                                                                  ����        J T�             K.        SetSparseMarkerIndexes                                                                                                                  ����        U� ^8             K.        DisableAllSparseMarkers                                                                                                                 ����        ^� l�             K.        ConfigureAMEnabled                                                                                                                      ����        m� {r             K.        ConfigureAMSource                                                                                                                       ����        |� ��             K.        ConfigureAMInternal                                                                                                                     ����        �� ��             K.        ConfigureFMEnabled                                                                                                                      ����        �� ��             K.        ConfigureFMSource                                                                                                                       ����        �� ��             K.        ConfigureFMInternal                                                                                                                     ����        �� ќ             K.        SetAttributeViInt32                                                                                                                     ����        �7 �             K.        SetAttributeViInt64                                                                                                                     ����        �K -             K.        SetAttributeViReal64                                                                                                                    ����        �  �             K.        SetAttributeViString                                                                                                                    ����        "C ;&             K.        SetAttributeViBoolean                                                                                                                   ����        <� U�             K.        SetAttributeViSession                                                                                                                   ����        W? l             K.        GetAttributeViInt32                                                                                                                     ����        mO �"             K.        GetAttributeViInt64                                                                                                                     ����        �_ �8             K.        GetAttributeViReal64                                                                                                                    ����        �u �u             K.        GetAttributeViString                                                                                                                    ����        �� ��             K.        GetAttributeViBoolean                                                                                                                   ����        � ��             K.        GetAttributeViSession                                                                                                                   ����        � ��             K.        CheckAttributeViInt32                                                                                                                   ����        � �             K.        CheckAttributeViInt64                                                                                                                   ����        � ($             K.        CheckAttributeViReal64                                                                                                                  ����        )� >)             K.        CheckAttributeViString                                                                                                                  ����        ?� T0             K.        CheckAttributeViBoolean                                                                                                                 ����        U� j8             K.        CheckAttributeViSession                                                                                                                 ����        k� z�             K.        AbortGeneration                                                                                                                         ����        { �             K.        InitiateGeneration                                                                                                                      ����        �� ��             K.        SendSoftwareStopTrigger                                                                                                                 ����        �_ ��             K.        SendSoftwareHoldTrigger                                                                                                                 ����        �$ �r             K.        SendSoftwareResumeTrigger                                                                                                               ����        �� �<             K.        SendSoftwareAdvanceTrigger                                                                                                              ����        �� ��             K.        SendSoftwareTrigger                                                                                                                     ����        �i �i             K.        reset                                                                                                                                   ����        �� ��             K.        ResetWithDefaults                                                                                                                       ����        �V �             K.        self_test                                                                                                                               ����        �} �i             K.        Disable                                                                                                                                 ����        �� �             K.        InvalidateAllAttributes                                                                                                                 ����        � �l             K.        revision_query                                                                                                                          ����        �h u             K.        error_query                                                                                                                             ����        q 4:             K.        error_message                                                                                                                           ����        56 >�             K.        GetChannelName                                                                                                                          ����        ?� H�             K.        GetSpecificDriverCHandle                                                                                                                ����        I< X�             K.        GetError                                                                                                                                ����        Z b�             K.        ClearError                                                                                                                              ����        c\ z#             K.        GetNextInterchangeWarning                                                                                                               ����        { ��             K.        ClearInterchangeWarnings                                                                                                                ����        �* ��             K.        ResetInterchangeCheck                                                                                                                   ����        �E �b             K.        GetNextCoercionRecord                                                                                                                   ����        �V �             K.        LockSession                                                                                                                             ����        �� �%             K.        UnlockSession                                                                                                                           ����        �� �?             K.        close                                                                                                                                         v                                                                                     �Initialize                                                                           �Initialize With Options                                                             7NConfiguration Functions                                                              �Configure Output Mode                                                                �Configure Operation Mode                                                             �Configure Output Enabled                                                             �Configure Output Impedance                                                           �Configure Ref Clock Source                                                           �Configure Sample Clock [SC]                                                          �Configure Sample Clock Output Enabled [SC]                                          8�Standard Waveform                                                                    �Configure Std Waveform [STD]                                                        :�Arbitrary Waveform                                                                   �Clear Arbitrary Wfm [ARB]                                                            �Configure Arbitrary Wfm [ARB]                                                        �Configure Sample Rate [ARB]                                                          �Create Arbitrary Wfm [ARB]                                                           �Create Channel Arbitrary Waveform  [ACH]                                             �Create Channel Arbitrary Waveform Int16 [AB]                                         �Create Channel Arbitrary Waveform Int32 [AB]                                         �Qry Arb Wfm Capabilities [ARB]                                                       �Qry Arb Wfm Capabilities 64 [ARB64]                                                 ;�Arbitrary Waveform Frequency                                                         �Configure Arb Frequency [AF]                                                        <^Arbitrary Sequence                                                                   �Qry Arb Seq Capabilities [SEQ]                                                       �Create Arb Sequence [SEQ]                                                            �Configure Arb Sequence [SEQ]                                                         �Clear Arb Sequence [SEQ]                                                             �Clear Arbitrary Memory [SEQ]                                                        >&Triggering                                                                           �Configure Trigger Source [TRG]                                                       �Configure Start Trigger [STT]                                                        �Configure Stop Trigger [SPT]                                                         �Configure Hold Trigger [HT]                                                          �Configure Resume Trigger [RT]                                                        �Configure Advance Trigger [AT]                                                      >tInternal Trigger                                                                     �Configure Internal Rate [IT]                                                        >�Burst                                                                                �Configure Burst Count [BST]                                                         ?]Data Marker                                                                          �Configure Data Marker [DM]                                                           �Get Data Marker Name [DM]                                                            �Disable All Data Markers [DM]                                                       A�Sparse Markers                                                                       �Configure Sparse Marker [SM]                                                         �Get Sparse Marker Name [SM]                                                          �Get Sparse Marker Indexes [SM]                                                       �Set Sparse Marker Indexes [SM]                                                       �Disable All Sparse Markers [SM]                                                     DsAmplitude Modulation                                                                 �Configure AM Enabled [AM]                                                            �Configure AM Source [AM]                                                             �Configure AM Internal [AM]                                                          FfFrequency Modulation                                                                 �Configure FM Enabled [FM]                                                            �Configure FM Source [FM]                                                             �Configure FM Internal [FM]                                                          HYSet/Get/Check Attribute                                                             H�Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViInt64                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             I>Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViInt64                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             I�Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViInt64                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           JbAction/Status Functions                                                              �Abort Generation                                                                     �Initiate Generation                                                                  �Send Software Stop Trigger [SPT]                                                     �Send Software Hold Trigger [HT]                                                      �Send Software Resume Trigger [RT]                                                    �Send Software Advance Trigger [AT]                                                   �Send Software Trigger [SWT]                                                         J�Utility Functions                                                                    �Reset                                                                                �Reset With Defaults                                                                  �Self-Test                                                                            �Disable                                                                              �Invalidate All Attributes                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Get Channel Name                                                                     �Get Specific Driver C Handle                                                        L;Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         L�Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             L�Coercion Info                                                                        �Get Next Coercion Record                                                            M.Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           