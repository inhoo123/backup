package acquire;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

public class UUIDUsage {
	public static void main(String[] args) {

		Set<String> ids = new HashSet<>();
		System.out.println(ids.size());
		
		
		for (int cnt = 1; cnt <= 100000; cnt++) {
			UUID uuid = UUID.randomUUID();
//			System.out.println(uuid.toString()); // 8 - 4 - 4 - 4 - 12

			String code = uuid.toString().substring(0, 8);
//			System.out.println(code);
			ids.add(code);
		}
		
		System.out.println(ids.size());
	}
}
