package cpuex2;

import java.util.EventObject;

enum SimulationEventType {
	INIT, STEP, EXIT
}

public class SimulationEvent extends EventObject {
	public SimulationEventType type;
	
	public SimulationEvent(Object source, SimulationEventType type) {
		super(source);
		this.type = type;
	}
}