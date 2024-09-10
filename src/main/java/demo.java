import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import static java.lang.Integer.parseInt;

public class demo {
    public static void main(String[] args) {
        String jdbcUrl="jdbc:mysql://localhost:3306/app_db";
        String username="root";
        String password="";
        String filename="demo";
        String filePath="C:\\Users\\k bharath sai\\Desktop\\AppProject\\"+filename+".csv";

        int batchSize=20;

        Connection connection=null;


        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(jdbcUrl,username,password);
            connection.setAutoCommit(false);

            String sql="insert into demo(id,name,address,salary) values(?,?,?,?)";

            PreparedStatement statement=connection.prepareStatement(sql);

            BufferedReader lineReader=new BufferedReader(new FileReader(filePath));

            String lineText=null;
            int count=0;

            lineReader.readLine();
            while ((lineText=lineReader.readLine())!=null){
                String[] data=lineText.split(",");

                String id=data[0];
                String name=data[1];
                String address=data[2];
                String salary=data[3];

                statement.setInt(1,parseInt(id));
                statement.setString(2,name);
                statement.setString(3,address);
                statement.setInt(4,parseInt(salary));
                statement.addBatch();
                if(count%batchSize==0){
                    statement.executeBatch();
                }
            }
            lineReader.close();
            statement.executeBatch();
            connection.commit();
            connection.close();
            System.out.println("Data has been inserted successfully.");

        }
        catch (Exception exception){
            exception.printStackTrace();
        }

    }
}