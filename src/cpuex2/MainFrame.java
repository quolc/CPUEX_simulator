package cpuex2;

import java.util.*;
import java.util.List;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.datatransfer.*;
import javax.swing.*;
import javax.swing.table.*;
import javax.swing.event.*;

public class MainFrame extends JFrame implements ActionListener, SimulationEventListener{	
	// visual components
	JMenuBar menuBar;
	JToolBar toolBar;
	JLabel statusBar;
	JTable codeTable, registerTable, memoryTable;
	JTextArea outputArea;
	JScrollPane codePane, registerPane, outputPane, memoryPane;
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
		this.initializeMemoryView();
		this.initializeOutputView();
		
		// レイアウトの細かい調整
		this.pack();
		this.setLocationRelativeTo(null);
		this.setVisible(true);
		this.mainPane.setDividerLocation(0.8);
		this.upperPane.setDividerLocation(0.8);
		this.lowerPane.setDividerLocation(0.7);
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
		menuDebug.add(menuStep);
		
		menuOpen.setActionCommand("open");
		menuExit.setActionCommand("exit");
		menuRun.setActionCommand("run");
		menuPause.setActionCommand("pause");
		menuHalt.setActionCommand("halt");
		menuStep.setActionCommand("step");
		
		menuOpen.addActionListener(this);
		menuExit.addActionListener(this);
		menuRun.addActionListener(this);
		menuPause.addActionListener(this);
		menuHalt.addActionListener(this);
		menuStep.addActionListener(this);
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
		
		this.codePane = new JScrollPane(this.codeTable);
		
		// D&D関係
		class FileDropHandler extends TransferHandler {
			MainFrame frame;
			
			public FileDropHandler(MainFrame frame) {
				this.frame = frame;
			}
			
			@Override
			public boolean canImport(TransferSupport support) {
				return support.isDataFlavorSupported(DataFlavor.javaFileListFlavor);
			}
			
			@Override
			public boolean importData(TransferSupport support) {
				if (!canImport(support)) {
					return false;
				}
				
				Transferable transferable = support.getTransferable();
				try {
					for (Object o : (List)support.getTransferable().getTransferData(DataFlavor.javaFileListFlavor)) {
						if (o instanceof File) {
							File file = (File)o;
							this.frame.loadAssemblyFile(file);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
				return true;
			}
		};
		this.codeTable.setDropMode(DropMode.USE_SELECTION);
		this.codeTable.setTransferHandler(new FileDropHandler(this));
		this.codeTable.setFillsViewportHeight(true);
		
		this.upperPane.add(this.codePane);
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
		
		final MainFrame self = this;
		final DefaultTableModel tm = new DefaultTableModel(rowData.toArray(new String[][]{}), colNames) {
			@Override
			public boolean isCellEditable(int row, int column) {
				if (column == 1 || column == 3) {
					if (self.currentSimulation != null) {
						if (!self.currentSimulation.running) {
							return true;
						}
					}
				}
				return false;
			}
		};
				
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
		this.registerTable.getColumn("Reg1").setPreferredWidth(30);
		this.registerTable.getColumn("Reg2").setPreferredWidth(30);
		this.registerTable.getColumn("Val1").setPreferredWidth(70);
		this.registerTable.getColumn("Val2").setPreferredWidth(70);
		
		class MyCellListener implements CellEditorListener {
			public void editingStopped( ChangeEvent e ) {
				int column = self.registerTable.getSelectedColumn();
				int row = self.registerTable.getSelectedRow();
				if (row < 0 || column < 0) return;
				
				String data = (String)self.registerTable.getValueAt(row, column);
				if (!self.currentSimulation.error && !self.currentSimulation.exit && !self.currentSimulation.halt && !self.currentSimulation.running) {
					switch (column) {
					case 1:
						if (row == 0) {
							try {
								Integer p = Integer.parseInt(data);
								self.currentSimulation.pc = p;
							} catch(Exception ex){}
							self.updateCode();
						} else if (row == 1) {
							try {
								Integer c = Integer.parseInt(data);
								if (c == 0 || c == 1) {
									self.currentSimulation.cz = (c == 1);
								}
							} catch (Exception ex) { }
						} else if (row == 2) {
							try {
								Integer c = Integer.parseInt(data);
								if (c == 0 || c == 1) {
									self.currentSimulation.cv = (c == 1);
								}
							} catch (Exception ex) { }
						} else if (row > 3) { // rレジスタ書き換え
							try {
								Integer r = Integer.parseInt(data);
								self.currentSimulation.r[row-3] = r;
							} catch(Exception ex) {}
						}
						break;
					case 3:
						if (row == 1) {
							try {
								Integer c = Integer.parseInt(data);
								if (c == 0 || c == 1) {
									self.currentSimulation.cn = (c == 1);
								}
							} catch (Exception ex) { }
						} else if (row == 2) {
							try {
								Integer c = Integer.parseInt(data);
								if (c == 0 || c == 1) {
									self.currentSimulation.cc = (c == 1);
								}
							} catch (Exception ex) { }
						} else if (row > 3) { // fレジスタ書き換え
							try {
								Float f = Float.parseFloat(data);
								self.currentSimulation.f[row-3] = f;
							} catch(Exception ex) {}
						}
						break;
					}
				}
				self.updateRegister(false);
			}
			public void editingCanceled( ChangeEvent e ){
			}
		}
		class MyCellEditor extends DefaultCellEditor {
			MyCellEditor(JTextField tf) {
				super(tf);
				this.addCellEditorListener(new MyCellListener());
			}
		};
		this.registerTable.getColumnModel().getColumn(1).setCellEditor(new MyCellEditor(new JTextField()));
		this.registerTable.getColumnModel().getColumn(3).setCellEditor(new MyCellEditor(new JTextField()));
		
		this.registerPane = new JScrollPane(this.registerTable);
		this.registerPane.setSize(new Dimension(200, 600));
		
		this.upperPane.add(this.registerPane);
	}
	public void initializeMemoryView() {
		String[] colNames = {
				"Address (Word)",
				"0",
				"1",
				"2",
				"3",
//				"Ascii"
			};
		ArrayList<String[]> rowData = new ArrayList<String[]>();
		for (int i=0; i<this.currentSimulation.ramsize; i+=4) { // 1行に4word表示, 全部で1024*1024word
			rowData.add(new String[] {
				String.format("0x%06x", i),
				"0x00000000 (0)",
				"0x00000000 (0)",
				"0x00000000 (0)",
				"0x00000000 (0)",
				".... .... .... ...."
			});
		}
		final MainFrame self = this;
		final DefaultTableModel tm = new DefaultTableModel(rowData.toArray(new String[][]{}), colNames) {
			@Override
			public boolean isCellEditable(int row, int column) {
				if (column >= 1) {
					if (self.currentSimulation != null && self.currentSimulation.running == false) {
						return true;
					}
				}
				return false;
			}
		};
		
		this.memoryTable = new JTable(tm) {
			// TODO 編集強調
		};
		
		class MyCellListener implements CellEditorListener {
			public void editingStopped( ChangeEvent e ){
				int column = self.memoryTable.getSelectedColumn();
				int row = self.memoryTable.getSelectedRow();
				if (row < 0 || column < 0) return;
				
				int addr = row*4 + column - 1;
				String data = (String)self.memoryTable.getValueAt(row, column);
				
				// Parse
				try {
					Integer i = Integer.decode(data);
					if (!self.currentSimulation.error && !self.currentSimulation.exit && !self.currentSimulation.halt && !self.currentSimulation.running) {
						self.currentSimulation.ram[addr] = i;
					}
				} catch (Exception ex) {}
				self.updateMemory(addr, false);
			}
			public void editingCanceled( ChangeEvent e ){
			}
		}
		class MyCellEditor extends DefaultCellEditor {
			MyCellEditor(JTextField tf) {
				super(tf);
				this.addCellEditorListener(new MyCellListener());
			}
		};
		this.memoryTable.getColumnModel().getColumn(1).setCellEditor(new MyCellEditor(new JTextField()));
		this.memoryTable.getColumnModel().getColumn(2).setCellEditor(new MyCellEditor(new JTextField()));
		this.memoryTable.getColumnModel().getColumn(3).setCellEditor(new MyCellEditor(new JTextField()));
		this.memoryTable.getColumnModel().getColumn(4).setCellEditor(new MyCellEditor(new JTextField()));
		
		this.memoryPane = new JScrollPane(this.memoryTable);
		this.memoryPane.setSize(new Dimension(800, 200));
		
		this.lowerPane.add(this.memoryPane);
	}
	public void initializeOutputView() {
		this.outputArea = new JTextArea();
		this.outputPane = new JScrollPane(this.outputArea);
		this.lowerPane.add(this.outputPane);
	}
	
	// Visual Update
	public void updateCode() {
		DefaultTableModel mt = (DefaultTableModel)this.codeTable.getModel();
		mt.setRowCount(0);
		
		int index=0;
		for (int i=0; i<this.currentSimulation.program.instructions.length; i++) {
			Instruction instruction = this.currentSimulation.program.instructions[i];
			
			for (Map.Entry<String, Integer> label: this.currentSimulation.program.labels.entrySet()) {
				if (label.getValue() == i) {
					mt.addRow(new String[] {
						"",
						"",
						label.getKey()
					});
					index++;
				}
			}
			
			mt.addRow(new String[] {
				Integer.toString(i),
				"",
				instruction.raw.replaceFirst("\t", "    "),
				(instruction.fl ? "f" : "") + instruction.opcode.toString(),
				instruction.condition.toString(),
				instruction.conditionset ? "o" : "",
				instruction.oplands[0] == null ? "" : instruction.oplands[0].toString(),
				instruction.oplands[1] == null ? "" : instruction.oplands[1].toString(),
				instruction.oplands[2] == null ? "" : instruction.oplands[2].toString(),
			});
			
			/*
			index++;
			if (i == this.currentSimulation.pc) {
				this.codeTable.scrollRectToVisible(
					new Rectangle(
						0, this.codeTable.getRowHeight()*(index+3), 
						100, this.codeTable.getRowHeight()));
			}*/
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
		
		String pcstr = Integer.toString(this.currentSimulation.pc);
		if (this.currentSimulation.exit) pcstr = "exit";
		if (this.currentSimulation.error) pcstr = "error";
		if (this.currentSimulation.halt) pcstr = "halt";
		mt.addRow(new String[]{
			"pc", pcstr, "", ""
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
				Float.toString(this.currentSimulation.f[i])
			});
		}
	}
	String int2hex(int v) {
		return String.format("%x%07x (%d)", v>>28, v & 268435455, v);
	}
	public void updateMemory(int addr, final boolean coloring) {
		// -1はオールクリア
		if (addr == -1) {
			DefaultTableModel mt = (DefaultTableModel)this.memoryTable.getModel();
			mt.setRowCount(0);
			
			for (int i=0; i<Simulation.ramsize; i+=4) { // 1行に4word表示, 全部で1024*1024word
				mt.addRow(new String[] {
					String.format("0x%06x", i),
					"00000000 (0)",
					"00000000 (0)",
					"00000000 (0)",
					"00000000 (0)",
					".... .... .... ...."
				});
			}
		} else {
			DefaultTableModel mt = (DefaultTableModel)this.memoryTable.getModel();
			mt.setValueAt(int2hex(this.currentSimulation.ram[addr]), addr/4, addr%4+1);
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
		
		if (e.getActionCommand().equals("run")) {
			this.runSimulation();
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
			this.updateMemory(-1, false);
			break;
		case STEP:
			this.updateCode();
			this.updateRegister(true);
			this.statusBar.setText("Step.");
			break;
		case EXIT:
			this.updateRegister(false);
			this.statusBar.setText("Exit.");
			break;
		case HALT:
			this.updateRegister(false);
			this.statusBar.setText("Halted.");
			break;
		case PRINT:
			this.outputArea.append(String.format("%d\n", e.param));
			break;
		case MEMORY:
			this.updateMemory((Integer)e.param, true);
			break;
		case ERROR:
			this.outputArea.append((String)e.param + "\n");
			break;
		}
	}
	
	public void loadAssemblyFile(File asmFile) {
		this.haltSimulation();
		
		Simulation newSimulation = Simulation.createSimulation(asmFile);
		if (newSimulation == null) {
			this.statusBar.setText("Failed to load file.");
			return;
		}
		this.currentSimulation = newSimulation;
		this.currentSimulation.addEventListener(this);
		
		this.initializeSimulation();
		this.statusBar.setText("Loaded Assembly File.");
	}
	public void initializeSimulation() {
		if (this.currentSimulation == null) {
			return;
		}
		
		this.currentSimulation.initialize();
		this.statusBar.setText("Initialized.");
	}
	
	// Simulation Control
	public void runSimulation () {
		if (this.currentSimulation == null) return;
		if (this.currentSimulation.running) return;
		
		// TODO start running
	}
	
	public void haltSimulation() {
		if (this.currentSimulation == null) return;
		if (this.currentSimulation.running) this.currentSimulation.stopRunning();
		
		this.currentSimulation.initialize();
	}
	public void stepSimulation() {
		if (this.currentSimulation == null) return;
		if (this.currentSimulation.running) return;
		
		this.currentSimulation.step();
	}
}
