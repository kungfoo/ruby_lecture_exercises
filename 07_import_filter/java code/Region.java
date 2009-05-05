package ch.hsr.ibis.mser.MSERDetector.Region;

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
}
