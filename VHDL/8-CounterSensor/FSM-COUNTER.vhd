-- ==================================================== --
-- ===    FINITE STATE MACHINE: COUNTER SENSOR   ====== --
-- ==================================================== --
Library IEEE;   
Use IEEE.STD_LOGIC_1164.ALL;    

Entity SensorCounter is
    Port (
        CLK: in STD_LOGIC;  
        Sensors: in STD_LOGIC_VECTOR(1 downto 0);   
        CounterPeople: out STD_LOGIC_VECTOR(1 downto 0) 
    );
End SensorCounter;  

Architecture Behave of SensorCounter is 
    Type States is (q0, q1, q2, q3, q4, q5, q6, q7);  
    Signal CurrentState, NextState: States;

        Begin 
            FiniteStateMachine : Process(CurrentState, Sensors)
            Begin
                Case CurrentState is
                    When q0 => 
                        Case Sensors is
                            When "00" => NextState <= q0;
                            When "01" => NextState <= q4;
                            When "10" => NextState <= q1;
                            When "11" => NextState <= q7;
                        End Case;
                End Case;
            End Process FiniteStateMachine;
    
End Behave;
