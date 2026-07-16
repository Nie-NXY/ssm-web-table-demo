package cn.key.gwc;

import java.util.Collection;
import java.util.Hashtable;
import java.util.Set;

import com.sun.org.apache.regexp.internal.recompile;

public class Gwc {
	private Hashtable<Integer, GwcItem> items = new Hashtable<Integer, GwcItem>();
	
	public Collection<GwcItem> getItems() {
		return items.values();
	}
	public int getSize() {
		return items.size();
	}
	public void addBook(GwcItem item) {
		Set<Integer> ids = items.keySet();
		Integer itemId = item.getBookId();
		if(ids.contains(itemId)) {
			GwcItem old = items.get(itemId);
			old.setNum(old.getNum() + 1);
			items.put(itemId, old);
		}else {
			items.put(itemId, item);
		}
	}
	
	public void updateNum(int id, int num) {
		GwcItem old = items.get(id);
		old.setNum(num);
		items.put(id, old);
	}
	
	public void delete(int id) {
		items.remove(id);
	}
	
	public void clear() {
		items.clear();
	}
	//0 ∆’Õ® 1 ‘∆π§≥ß
	public float[] getSum() {
		float[] sum = new float[]{0, 0};
		Collection<GwcItem> gwcItems = items.values();
		for (GwcItem item : gwcItems) {
			sum[0] += item.getNum() * item.getPrice();
			sum[1] += item.getNum() * item.getYgcPrice();
		}
		return sum;
	}
}
