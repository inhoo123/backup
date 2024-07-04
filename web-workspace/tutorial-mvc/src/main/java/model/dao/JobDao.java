package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.vo.Job;
import oracle.jdbc.datasource.impl.OracleDataSource;


public class JobDao {

	public List<Job> findAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("hr");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM JOBS");

			ResultSet rs = stmt.executeQuery();
			List<Job> jobs = new ArrayList<>();
			while (rs.next()) {
				Job one = new Job(rs.getString("JOB_ID"), rs.getString("JOB_TITLE"), rs.getInt("MIN_SALARY"),
						rs.getInt("MAX_SALARY"));
				jobs.add(one);
			}

			return jobs;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}