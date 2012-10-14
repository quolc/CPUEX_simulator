package cpuex2;

import java.util.EventObject;

enum SimulationEventType {
	INIT, STEP,
	EXIT, HALT, ERROR,
	PRINT, MEMORY
}

public class SimulationEvent extends EventObject {
	public SimulationEventType type;
	public Object param;
	
	public SimulationEvent(Object source, SimulationEventType type, Object param) {
		super(source);
		this.type = type;
		this.param = param;
	}
}