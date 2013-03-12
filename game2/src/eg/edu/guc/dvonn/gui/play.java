package eg.edu.guc.dvonn.gui;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.GridLayout;
import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.geom.Ellipse2D;
import java.util.ArrayList;
import java.util.Stack;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import eg.edu.guc.dvonn.engine.Board;

public class play extends JFrame implements ActionListener, MouseListener{
	JPanel panel;
	JButton random;
	JButton manual;
	JButton size;
	JLabel label;
	Board board;
	int row;
	int column;
	ArrayList<Peice>grid;
	Stack<Point> click;
	
	public play(){
		super();
		this.setSize(600,600);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		panel = new JPanel();
		panel.setSize(600, 600);
		panel.setBackground(Color.gray);
		panel.setLayout(null);
		random = new JButton("Quick Start");
		random.addActionListener(this);
		random.setSize(100, 30);
		random.setLocation(60, 260);
		manual = new JButton("Start");
		manual.addActionListener(this);
		manual.setSize(100, 30);
		manual.setLocation(400, 260);
		size = new JButton("Custom Board Size");
		size.addActionListener(this);
		size.setSize(150, 20);
		size.setLocation(212, 350);
		label = new JLabel("Dvonn");
		label.setSize(100, 30);
		label.setLocation(190, 50);
		label.setFont(new Font("Serif", Font.BOLD, 19));
		label.setForeground(Color.WHITE);
		panel.add(random);
		panel.add(manual);
		panel.add(size);
		panel.add(label);
		this.add(panel);
		row = 5;
		column = 11; 
		panel.addMouseListener(this);
		this.addMouseListener(this);
		click = new Stack<Point>();
	}
	
	public void paintBoard(int row, int col,Board board){
		panel.removeAll();
		panel.setLayout(new GridLayout(row, col));
		for(int i = 0; i < row; i++){
			for(int j = 0; j < col; j++){
				if(board.isEmpty(i, j) == false){
				Peice p = new Peice(board.getColor(i, j), board.getHeight(i, j), board.hasRed(i, j));
				panel.add(p);
				}
				else{
					Peice p = new Peice(i, j);
					panel.add(p);
				}
			}
		}
		panel.setVisible(true);
		this.add(panel);
	}
	
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == random){
			board = new Board(row, column);
			board.fillRandom();
			this.paintBoard(row, column, board);
			this.setVisible(true);
		}
		if(e.getSource()== size){
			String rows = (String) JOptionPane.showInputDialog(null, "Enter Number Of Rows", "rows",  
			JOptionPane.QUESTION_MESSAGE, null, null, null);  
			String columns = (String) JOptionPane.showInputDialog(null, "Enter Number Of Columns", "Columns",  
            JOptionPane.QUESTION_MESSAGE, null, null, null);  
			row  = Integer.parseInt(rows);
			column = Integer.parseInt(columns);
		}
		if(e.getSource() == manual){
			board = new Board(row, column);
			this.paintBoard(row, column, board);
			this.setVisible(true);
		}
	}

	public static void main(String [] args){
		play game = new play();
		System.out.println(0%2);
	}

	@Override
	public void mouseClicked(MouseEvent r) {
		//System.out.print("clicked");
		//System.out.println(r.getX() + "j" + r.getY());
		click.push(r.getPoint());
		if(board.getCurrentPhase() == 0){
			int x = r.getY()/((600/row));
			int y = r.getX()/((600/column));
			System.out.println(x+"  " + y);
			board.put(x, y);
			this.paintBoard(row, column, board);
			this.setVisible(true);
			click.pop();
		}
		if(board.getCurrentPhase() == 1){
			if(click.size()==2){
				int x2 = r.getY()/((600/row));
				int y2 = r.getX()/((600/column));
				click.pop();
				System.out.println(x2+"  " + y2);
				int x1 = (click.peek().y)/((600/row));
				int y1 = (click.peek().x)/((600/column));
				click.pop();
				System.out.println(x1+"  " + y1);
				board.move(x1, y1, x2, y2);
				this.paintBoard(row, column, board);
				this.setVisible(true);
			}
		}
	}

	@Override
	public void mouseEntered(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mousePressed(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}
