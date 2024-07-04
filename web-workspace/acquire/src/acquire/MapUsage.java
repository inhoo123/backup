package acquire;

import java.util.HashMap;
import java.util.Map;

public class MapUsage {
	public static void main(String[] args) {
		Map<String, int[]> map = new HashMap<>();
		
		map.put("a", new int[] {1,2,3});
		
		int[]got=map.get("a");
		got[0] =99;
		
		map.put("a",got);
		
		int[] got2 = map.get("a");
		System.out.println(got2[0]);
	}

}
