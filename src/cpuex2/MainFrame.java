package cpuex2;

import java.util.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.table.*;

import com.sun.tools.internal.ws.processor.model.Model;

public class MainFrame extends JFrame implements ActionListener, SimulationEventListener{	
	// visual components
	JMenuBar menuBar;
	JToolBar toolBar;
	JLabel statusBar;
	JTable codeTable, registerTable;
	JScrollPane registerPane;
	JSplitPane mainPane, upperPane, lowerPane;
	
	Map<Integer, Integer> pc2rowMap;
	Map<Integer, Integer> row2pcMap;
	
	// logical components
	public Simulation currentSimulation;
	public static MainFrame instance = null;
	
	// Initialize
	public static MainFrame getInstance() {
		if (instance == null) {
			instance = new MainFrame("CPUEX2 Simulator");
		}
		return instance;
	}
	
	private MainFrame(String name) {
		super(name);
		
		// Initialize itself
//		this.setExtendedState(Frame.MAXIMIZED_BOTH);
		this.setMinimumSize(new Dimension(1000, 800));
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.getContentPane().setLayout(new BorderLayout());
		
		this.pc2rowMap = new HashMap<Integer, Integer>();
		this.row2pcMap = new HashMap<Integer, Integer>();
		
		// Main Layout
		this.mainPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT);
		this.mainPane.setResizeWeight(1.0);
		this.upperPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT);
		this.upperPane.setResizeWeight(1.0);
		this.lowerPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT);
		this.upperPane.setResizeWeight(1.0);
		this.mainPane.add(this.upperPane);
		this.mainPane.add(this.lowerPane);
		this.getContentPane().add(this.mainPane, BorderLayout.CENTER);
		
		// initialize sub components
		this.initializeMenuBar();
		this.initializeToolBar();
		this.initializeStatusBar();
		
		// initialize main components
		this.initializeCodeView();
		this.initializeRegisterView();
		
		// レイアウトの細かい調整
		this.pack();
		this.setLocationRelativeTo(null);
		this.setVisible(true);
		this.mainPane.setDividerLocation(0.8);
		this.upperPane.setDividerLocation(0.8);
		this.registerPane.getColumnHeader().setVisible(false);
		
		// Initialize Logical Components
		this.currentSimulation = null;
	}
	public void initializeMenuBar() {
		this.menuBar = new JMenuBar();
		JMenu menuFile = new JMenu("File");
		JMenuItem menuOpen = new JMenuItem("Open");
		JMenuItem menuExit = new JMenuItem("Exit");
		JMenu menuDebug = new JMenu("Debug");
		JMenuItem menuRun = new JMenuItem("Run");
		JMenuItem menuPause = new JMenuItem("Pause");
		JMenuItem menuHalt = new JMenuItem("Halt");
		JMenuItem menuStep = new JMenuItem("Step");
		
//		JMenuItem menuQuickSave = new JMenuItem("Save Current State");
//		JMenuItem menuQuickLoad = new JMenuItem("Load Current State");
		
		menuOpen.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, InputEvent.META_MASK));
		menuExit.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Q, InputEvent.META_MASK));
		menuRun.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, InputEvent.META_MASK));
		menuPause.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P, InputEvent.META_MASK));
		menuHalt.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_H, InputEvent.META_MASK));
		menuStep.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, InputEvent.META_MASK));
		
		getRootPane().setJMenuBar(this.menuBar);
		this.menuBar.add(menuFile);
		menuFile.add(menuOpen);
		menuFile.add(menuExit);
		this.menuBar.add(menuDebug);
		menuDebug.add(menuRun);
		menuDebug.add(menuPause);
		menuDebug.add(menuHalt);
		menuDebug.addSeparator();
		
		menuOpen.setActionCommand("open");
		menuExit.setActionCommand("exit");
		menuRun.setActionCommand("run");
		menuPause.setActionCommand("pause");
		menuHalt.setActionCommand("halt");
		
		menuOpen.addActionListener(this);
		menuExit.addActionListener(this);
		menuRun.addActionListener(this);
		menuHalt.addActionListener(this);
	}
	public void initializeToolBar() {
		this.toolBar = new JToolBar();
		this.toolBar.setFloatable(false);
		this.toolBar.setBackground(Color.WHITE);
		
		JButton buttonRun = new JButton();
		buttonRun.setText("Run");
		buttonRun.setActionCommand("run");
		
		JButton buttonPause = new JButton();
		buttonPause.setText("Pause");
		buttonPause.setActionCommand("pause");
		
		JButton buttonHalt = new JButton();
		buttonHalt.setText("Halt");
		buttonHalt.setActionCommand("halt");
		
		JButton buttonStep = new JButton();
		buttonStep.setText("Step");
		buttonStep.setActionCommand("step");
		
		this.getContentPane().add(this.toolBar, BorderLayout.NORTH);
		this.toolBar.add(buttonRun);
		this.toolBar.add(buttonPause);
		this.toolBar.add(buttonHalt);
		this.toolBar.add(buttonStep);
		
		buttonRun.addActionListener(this);
		buttonPause.addActionListener(this);
		buttonHalt.addActionListener(this);
		buttonStep.addActionListener(this);
	}
	public void initializeStatusBar() {
		this.statusBar = new JLabel("Ready.");
		getContentPane().add(statusBar, BorderLayout.SOUTH);
	}
	
	public void initializeCodeView() {
		String[] colNames = {
			"#",
			"✓",
			"Code",
			"OpCode",
			"Cond",
			"Set",
			"Opland1",
			"Opland2",
			"Opland3",
		};
		String[][] rowData = {};
		final DefaultTableModel tm = new DefaultTableModel(rowData, colNames) {
			@Override
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		};
		
		this.codeTable = new JTable(tm) {
			@Override public Component prepareRenderer(
				TableCellRenderer renderer, int row, int column) {
				Component c = super.prepareRenderer(renderer, row, column);
				c.setForeground(getForeground());
				
				// 現在いる行はオレンジ色に
				c.setBackground(tm.getValueAt(convertRowIndexToModel(row), 0).equals(
					Integer.toString(MainFrame.getInstance().currentSimulation.pc))
						? (MainFrame.getInstance().currentSimulation.willExecuteNextStep() ? Color.ORANGE : Color.RED)
						: getBackground());
				return c;
			}
		};
		
		this.codeTable.addMouseListener(new MouseAdapter() {
			@Override public void mouseClicked(MouseEvent me) {
				if(me.getClickCount()==2) {
					Point pt = me.getPoint();
					int idx = codeTable.rowAtPoint(pt);
					if(idx>=0) {
						int row = codeTable.convertRowIndexToModel(idx);
						String str = String.format("%s (%s)", codeTable.getValueAt(row, 1),
						tm.getValueAt(row, 2));
						JOptionPane.showMessageDialog(codeTable, str, "title", JOptionPane.INFORMATION_MESSAGE);
					}
				}
			}
		});
		
		this.codeTable.getColumn("#").setPreferredWidth(30);
		this.codeTable.getColumn("✓").setPreferredWidth(50);
		this.codeTable.getColumn("Code").setPreferredWidth(200);
		this.codeTable.getColumn("OpCode").setPreferredWidth(100);
		this.codeTable.getColumn("Cond").setPreferredWidth(50);
		this.codeTable.getColumn("Set").setPreferredWidth(50);
		this.codeTable.getColumn("Opland1").setPreferredWidth(100);
		this.codeTable.getColumn("Opland2").setPreferredWidth(100);
		this.codeTable.getColumn("Opland3").setPreferredWidth(100);
		
		JScrollPane sp = new JScrollPane(this.codeTable);
		sp.setSize(new Dimension(750, 600));
		
		this.upperPane.add(sp);
	}
	public void initializeRegisterView() {
		String[] colNames = {
			"Reg1",
			"Val1",
			"Reg2",
			"Val2"
		};
		ArrayList<String[]> rowData = new ArrayList<String[]>();
		rowData.add(new String[]{
			"pc", "0", "", ""
		});
		rowData.add(new String[] {
			"Z", "0", "N", "0"
		});
		rowData.add(new String[] {
			"V", "0", "C", "0"
		});
		for (int i=0; i<32; i++) {
			rowData.add(new String[]{
				String.format("r%d", i),
				"0",
				String.format("f%d", i),
				"0.0"
			});
		}
		
		final DefaultTableModel tm = new DefaultTableModel(rowData.toArray(new String[][]{}), colNames);
		
		this.registerTable = new JTable(tm) {
			@Override public Component prepareRenderer(
				TableCellRenderer renderer, int row, int column) {
				Component c = super.prepareRenderer(renderer, row, column);
				c.setForeground(getForeground());
				
				// レジスタ名にマーク（末尾の半角スペース）があるレジスタ値は背景をオレンジ色に
				boolean changed = false;
				if (column == 1) {
					changed = ((String)tm.getValueAt(convertRowIndexToModel(row), 0)).contains(" ");
				} else if (column == 3) {
					changed = ((String)tm.getValueAt(convertRowIndexToModel(row), 2)).contains(" ");
				}
				c.setBackground(changed ? Color.ORANGE : getBackground());
				return c;
			}
		};
//		this.registerTable.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		this.registerTable.getColumn("Reg1").setPreferredWidth(50);
		this.registerTable.getColumn("Reg2").setPreferredWidth(50);
		this.registerTable.getColumn("Val1").setPreferredWidth(50);
		this.registerTable.getColumn("Val2").setPreferredWidth(50);
		
		this.registerPane = new JScrollPane(this.registerTable);
		this.registerPane.setSize(new Dimension(100, 600));
		
		this.upperPane.add(this.registerPane);
	}
	public void initializeMemoryView() {
		
	}
	public void initializeOutputView() {
		
	}
	
	// Visual Update
	public void updateCode() {
		DefaultTableModel mt = (DefaultTableModel)this.codeTable.getModel();
		mt.setRowCount(0);
		
		for (int i=0; i<this.currentSimulation.program.instructions.length; i++) {
			Instruction instruction = this.currentSimulation.program.instructions[i];
			
			for (Map.Entry<String, Integer> label: this.currentSimulation.program.labels.entrySet()) {
				if (label.getValue() == i) {
					mt.addRow(new String[] {
						"",
						"",
						label.getKey()
					});
				}
			}
			
			mt.addRow(new String[] {
				Integer.toString(i),
				"",
				instruction.raw.replaceFirst("\t", "    "),
				(instruction.fl ? "?" : "") + instruction.opcode.toString(),
				instruction.condition.toString(),
				instruction.conditionset ? "o" : "",
				instruction.oplands[0] == null ? "" : instruction.oplands[0].toString(),
				instruction.oplands[1] == null ? "" : instruction.oplands[1].toString(),
				instruction.oplands[2] == null ? "" : instruction.oplands[2].toString(),
			});
		}
	}
	public void updateRegister(final boolean coloring) {
		DefaultTableModel mt = (DefaultTableModel)this.registerTable.getModel();
		
		// change detection
		boolean cz = false, cn = false, cv = false, cc = false;
		boolean[] cr = new boolean[32];
		for (int i=0; i<32; i++) cr[i] = false;
		boolean[] cf = new boolean[32];
		for (int i=0; i<32; i++) cf[i] = false;
		if (coloring) {
			cz = (mt.getValueAt(1, 1).equals("1") != this.currentSimulation.cz);
			cn = (mt.getValueAt(1, 3).equals("1") != this.currentSimulation.cn);
			cv = (mt.getValueAt(2, 1).equals("1") != this.currentSimulation.cv);
			cc = (mt.getValueAt(2, 3).equals("1") != this.currentSimulation.cc);
			for (int i=0; i<32; i++) {
				cr[i] = !(mt.getValueAt(3+i, 1).equals(Integer.toString(this.currentSimulation.r[i])));
				cf[i] = !(mt.getValueAt(3+i, 3).equals(Float.toString(this.currentSimulation.f[i])));
			}
		}
		
		mt.setRowCount(0);
		
		mt.addRow(new String[]{
			"pc", this.currentSimulation.exit ? "exit" : Integer.toString(this.currentSimulation.pc), "", ""
		});
		mt.addRow(new String[] {
			"Z" + (cz ? " " : ""),
			this.currentSimulation.cz ? "1" : "0",
			"N" + (cn ? " " : ""),
			this.currentSimulation.cn ? "1" : "0"
		});
		mt.addRow(new String[] {
			"V" + (cv ? " " : ""),
			this.currentSimulation.cv ? "1" : "0",
			"C" + (cc ? " " : ""),
			this.currentSimulation.cc ? "1" : "0"
		});
		for (int i=0; i<32; i++) {
			mt.addRow(new String[]{
				String.format("r%d" + (cr[i] ? " " : ""), i),
				Integer.toString(this.currentSimulation.r[i]),
				String.format("f%d" + (cf[i] ? " " : ""), i),
				Double.toString(this.currentSimulation.f[i])
			});
		}
	}
	
	// Event Handler
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().equals("exit")) {
			System.exit(0);
		}
		
		if (e.getActionCommand().equals("open")) {
			JFileChooser fileChooser = new JFileChooser();
			fileChooser.setCurrentDirectory(new File("."));
			
			int selected = fileChooser.showOpenDialog(this);
			if (selected == JFileChooser.APPROVE_OPTION) {
				File file = fileChooser.getSelectedFile();
				this.loadAssemblyFile(file);
			}
		}
		
		if (e.getActionCommand().equals("halt")) {
			this.haltSimulation();
		}
		
		if (e.getActionCommand().equals("step")) {
			this.stepSimulation();
		}
	}
	public void handleSimulationEvent(SimulationEvent e) {
		switch (e.type) {
		case INIT:
			this.updateCode();
			this.updateRegister(false);
			break;
		case STEP:
			this.updateCode();
			this.updateRegister(true);
			break;
		case EXIT:
			this.updateCode();
			this.updateRegister(true);
			this.statusBar.setText("Exit.");
			break;
		}
	}
	
	public void loadAssemblyFile(File asmFile) {
		this.haltSimulation();
		
		this.currentSimulation = Simulation.createSimulation(asmFile);
		this.initializeSimulation();
		this.updateCode();
		this.statusBar.setText("Loaded Assembly File.");
		this.currentSimulation.addEventListener(this);
	}
	public void initializeSimulation() {
		if (this.currentSimulation == null) {
			return;
		}
		
		this.currentSimulation.initialize();
		this.statusBar.setText("Initialized.");
	}
	
	public void haltSimulation() {
		if (this.currentSimulation == null) return;
		if (this.currentSimulation.running) this.currentSimulation.stopRunning();
		
		this.currentSimulation.initialize();
		this.statusBar.setText("Halted.");
	}
	public void stepSimulation() {
		if (this.currentSimulation == null) return;
		if (this.currentSimulation.running) return;
		
		this.currentSimulation.step();
		this.statusBar.setText("Step.");
	}
}
