package eg.edu.guc.dvonn.engine;

public class Board implements BoardInterface {
	private static int[] dx = {0, 1, 0, -1, 1, -1, -1, 1};
	private static int[] dy = {1, 0, -1, 0, 1, -1, 1, -1};
	Cell[][] board;
	int currentPhase, currentPiece;
	private int currentPlayer;
	private int piecesPut;
	int col, row;
	public Board(int i, int j) {
		col = i; row = j;
		currentPhase = 1;
		board = new Cell[i][j];
		for (int r = 0; r < board.length; r++) {
			for (int c = 0; c < board[r].length; c++) {
				board[r][c] = new Cell(r, c);
			}
		}
		currentPlayer = 2;
	}

	public void fillRandom() {
		int redPieces = 3;
		int whitePieces = (board.length * board[0].length - redPieces) / 2;
		int blackPieces = whitePieces;
		int[] counts = {redPieces, blackPieces, whitePieces};
		int[] colors = {Cell.RED, Cell.WHITE, Cell.BLACK};
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				int random, remaining = 0;
				for (int k = 0; k < counts.length; k++) {
					remaining += counts[k];
				}
				if (remaining == 0)
					break;
				while (counts[random = randomNumber(3)] <= 0);
				board[i][j] = new Cell(i, j, colors[random]);
				counts[random]--;
			}
		}
		currentPhase++;
		currentPiece = -1;
	}

	private int randomNumber(int i) {
		return (int)(Math.random() * i);
	}

	public boolean isEmpty(int row, int col) {
		return board[row][col].isEmpty();
	}

	public int getColor(int row, int col) {
		if (isEmpty(row, col))
			return -1;
		return board[row][col].getTopColor();
	}

	public boolean put(int i, int j) {
		int x = ((row*col -3)/2)*2+3;
		if (piecesPut >= x) return false;
		if(piecesPut > x) return false;
		if (!inPhaseOne())
			return false;
		if (piecesPut < 3)
			currentPiece = 0;
		else
			currentPiece = ((piecesPut - 3) % 2) + 1;
		if (currentPiece == 1)
			currentPiece = 2;
		else if (currentPiece == 2)
			currentPiece = 1;
		piecesPut++;
		board[i][j] = new Cell(i, j, this.currentPiece);
		return true;
	}

	private boolean inPhaseOne() {
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				if (board[i][j].isUninitialized()) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean move(int bi, int bj, int ei, int ej) {
		if (isEmpty(ei, ej) || getColor(bi, bj) != currentPlayer) {
			return false;
		}
		if (isSurrounded(bi, bj))
			return false;
		
		if(getDistance(bi, bj, ei, ej)!=getHeight(bi, bj))
			return false;
			
		board[bi][bj].move(board[ei][ej]);
		removeLonelyTowers();
		currentPlayer = currentPlayer == 1 ? 2 : 1;
		return true;
	}

	private int getDistance(int bi, int bj, int ei, int ej) {
		int diffRows = Math.abs(bi-ei);
		int diffCols = Math.abs(bj-ej);
		if(diffRows==diffCols){
			return diffRows;
		}
		else if(diffRows==0){
			return diffCols;
		}
		else if(diffCols==0){
			return diffRows;
		}
		else {
			return -1;
		}
	}

	private boolean isSurrounded(int bi, int bj) {
		int deg = 0;
		for (int i = 0; i < dx.length; i++) {
			int ni = bi + dx[i];
			int nj = bj + dy[i];
			if (inBounds(ni, nj) && !isEmpty(ni, nj))
				deg++;
		}
		return deg == 8;
	}

	public String toString() {
		String result = "";
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				result += (board[i][j].getTopColor() + " ");
			}
			result += "\n";
		}
		result += "-------------------------------------------------\n";
		return result;
	}

	private void removeLonelyTowers() {
		boolean[][] toRemove = new boolean[board.length][board[0].length];
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				boolean[][] vis = new boolean[board.length][board[i].length];
				if (!isEmpty(i, j) && !canReachRed(i, j, vis)) {
					toRemove[i][j] = true;
				}
			}
		}
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				if (toRemove[i][j]) {
					board[i][j].clear();
				}
			}
		}
	}

	private boolean canReachRed(int i, int j, boolean[][] vis) {
		if (board[i][j].hasRed())
			return true;
		if (vis[i][j] || isEmpty(i, j))
			return false;
		vis[i][j] = true;
		for (int d = 0; d < dx.length; d++) {
			int ni = i + dx[d];
			int nj = j + dy[d];
			if (inBounds(ni, nj) && canReachRed(ni, nj, vis)) {
				return true;
			}
		}
		return false;
	}

	public boolean isGameOver() {
		return !canMove(1) && !canMove(2);
	}

	private boolean canMove(int p) {
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				if (getHeight(i, j) == 0 || getColor(i, j) != p)
					continue;
				for (int d = 0; d < dx.length; d++) {
					int ni = i + dx[d] * getHeight(i, j);
					int nj = j + dy[d] * getHeight(i, j);
					if (inBounds(ni, nj) && !isEmpty(ni, nj)) {
						return true;
					}
				}
			}
		}
		return false;
	}

	private boolean inBounds(int ni, int nj) {
		return 0 <= ni && ni < board.length && 0 <= nj && nj < board[0].length;
	}

	public int getWinner() {
		int maxHeight = 0, winner = -1;
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board.length; j++) {
				if (maxHeight < getHeight(i, j)) {
					maxHeight = getHeight(i, j);
					winner = getColor(i, j);
				}
			}
		}
		return winner;
	}

	public int getHeight(int i, int j) {
		return board[i][j].getHeight();
	}

	public boolean hasRed(int i, int j) {
		return board[i][j].hasRed();
	}

	public int getCurrentPhase() {
		return inPhaseOne() ? 0 : 1;
	}

}
