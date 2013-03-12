package eg.edu.guc.dvonn.engine;

import java.util.ArrayList;

public class Cell {
	final static int RED = 0;
	final static int WHITE = 1;
	final static int BLACK = 2;
	private ArrayList<Integer> pieces;
	private int i, j;
	private boolean initialized;
	
	public Cell(int i, int j, int type) {
		pieces = new ArrayList<Integer>();
		pieces.add(type);
		this.i = i;
		this.j = j;
		initialized = true;
	}

	public Cell(int i, int j) {
		pieces = new ArrayList<Integer>();
		this.i = i;
		this.j = j;
	}

	public boolean isEmpty() {
		return pieces.isEmpty();
	}

	public boolean hasRed() {
		return pieces.contains(RED);
	}

	public int getTopColor() {
		if (pieces.size() == 0)
			return 8;
		return pieces.get(pieces.size() - 1);
	}

	public boolean isUninitialized() {
		return !initialized;
	}

	public int getHeight() {
		return pieces.size();
	}

	public void move(Cell cell) {
		ArrayList<Integer> source = this.pieces;
		ArrayList<Integer> destination = cell.pieces;
		destination.addAll(source);
		source.clear();
	}

	public void clear() {
		pieces.clear();
	}

}
