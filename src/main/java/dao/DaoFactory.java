package dao;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DaoFactory {
	// UserDaoを生成するメソッド
	public static UserDao createUserDao() {
		return new UserDaoImpl(getDataSource());
	}

	// AdminDaoを生成するメソッド
	public static AdminDao createAdminDao() {
		return new AdminDaoImpl(getDataSource());
	}

	// PlanDaoを生成するメソッド
	public static PlanDao createPlanDao() {
		return new PlanDaoImpl(getDataSource());
	}

	// CategoryDaoを生成するメソッド
	public static CategoryDao createCategoryDao() {
		return new CategoryDaoImpl(getDataSource());
	}

	// データソースを生成するためのメソッド
	private static DataSource getDataSource() {
		InitialContext ctx = null;
		DataSource ds = null;
		try {
			ctx = new InitialContext(); // JNDIのコンテキストを初期化
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/plans_db");
		} catch (NamingException e) { // JNDI関連の操作中に発生する"チェック"例外
			if (ctx != null) {
				try {
					ctx.close();
				} catch (NamingException e1) {
					throw new RuntimeException(e1); // Javaの実行時に発生する"非チェック"例外
				}
			}
			throw new RuntimeException(e);
		}
		return ds;
	}
}
