package cr.ac.database.managers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class ODBCDBManager extends DBManager {

    // <editor-fold defaultstate="collapsed" desc="constructors">
    ODBCDBManager(String serverURL)
            throws ClassNotFoundException,
            IllegalAccessException,
            InstantiationException,
            IOException {
        super("ODBC database manager", serverURL);
    }

    ODBCDBManager()
            throws ClassNotFoundException,
            IllegalAccessException,
            InstantiationException,
            IOException {
        this(SERVER_DEFAULT);
    }

    @Override
    public Connection getConnection(String database, String user, String password)
            throws SQLException {
        throw new UnsupportedOperationException();
    }

}
