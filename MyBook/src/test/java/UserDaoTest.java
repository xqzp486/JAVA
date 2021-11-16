import com.atguigu.dao.UserDao;
import com.atguigu.dao.impl.UserDaoImpl;
import com.atguigu.pojo.User;
import junit.framework.TestCase;


public class UserDaoTest extends TestCase {
    public void testQueryUserByUsername() {
        UserDao userDao = new UserDaoImpl();
        if (userDao.queryUserByUsername("admin") == null) {
            System.out.println("用户名可用!");
        } else {
            System.out.println("用户名已存在!");
        }
    }

    public void testSaveUser() {
        UserDao userDao = new UserDaoImpl();
        System.out.println(userDao.saveUser(new User(null, "wzg168", "123456", "wzg168@qq.com")));
    }

    public void testQueryUserByUsernameAndPassword() {
        UserDao userDao = new UserDaoImpl();
        if (userDao.queryUserByUsernameAndPassword("admin", "admin") != null) {
            System.out.println("登录成功!");
        } else {
            System.out.println("用户名或者密码错误，登录失败");
        }
    }
}