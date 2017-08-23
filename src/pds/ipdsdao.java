package pds;

import java.util.List;

public interface ipdsdao {
	public boolean writePds(pdsdto pds);
	public List<pdsdto> getPdsList();
	public boolean downloadcount(int seq);
	

}
