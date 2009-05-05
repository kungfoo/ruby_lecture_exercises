package ch.hsr.ibis.mser;


import ch.hsr.ibis.common.Feature;
import ch.hsr.ibis.matrix.EllipseOperations;
import ch.hsr.ibis.matrix.Matrix;
import ch.hsr.ibis.mser.MSERDetector.PixelForest;

public class Region {
	// how much does the area need to change, that a region is not called a
	// duplicate?
	private static final double MINIMUM_AREA_CHANGE = 0.5;

	// keep track of the region size over the last DELTA image levels
	private int[] Q;
	private int last_added_sample = 0;
	// how many levels has this one existed?
	public int existed = 1;

	private float[] js = new float[3];
	private int last_j = 0;

	// the parent element for this region
	public int parent;
	private PixelForestNode[] pixels;
	// forest this Region resides in
	private PixelForest forest;

	
	/**
	 * check whether the pixel is surrounded by 4-way neighbours of the same
	 * region
	 * 
	 * @param pixel
	 * @return
	 */
	private boolean isPixelNotSurrounded(int pixel) {
		int[] neighbours = forest.findNeighbours(pixel);	
		for(int i = 0; i < neighbours.length; i++){
			// if one of the neighbours is not in the forest, it can't be surrounded
			if(neighbours[i] != -1 && pixels[neighbours[i]].parent == -1){
				return true;
			}
			else if(neighbours[i] != -1 && forest.find(pixel) != forest.find(neighbours[i])){
				return true;
			}
			else if(neighbours[i] == -1){
				// it is an image border pixel
				return true;
			}
		}
		// if the pixel has passed all tests, it is in fact surrounded
		// mark it as an inside pixel
		pixels[pixel].isOutlinePixel = false;
		return false;
	}

	@Override
	public String toString() {
		return "(" + pixels[parent].x + "," + pixels[parent].y + "):"
				+ pixels[parent].area;
	}
}
