package com.atguigu.controller;

import com.atguigu.dao.DepartmentDao;
import com.atguigu.dao.EmployeeDao;
import com.atguigu.entities.Department;
import com.atguigu.entities.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeDao employeeDao;

    @Autowired
    DepartmentDao departmentDao;

    /**
     * 查询所有员工
     * @param model
     * @return
     */
    @RequestMapping("/emps")
    public String getEmps(Model model){
        Collection<Employee> emps = employeeDao.getAll();
        model.addAttribute("emps",emps);
        return "list";
    }

    /**
     * 去员工添加页面，去页面之前需要查出所有部门信息，进行展示
     * @return
     */
    @RequestMapping("/toaddpage")
    public String toAddPage(Model model){
        //1、先查出所有的部门
        Collection<Department> departments = departmentDao.getDepartments();
        //2、放到请求域中
        model.addAttribute("depts",departments);
        model.addAttribute("employee",new Employee());
        return "add";
    }

    /**
     * 添加员工
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public String addEmp(Employee employee){
        System.out.println("要添加的员工"+employee);
        employeeDao.save(employee);
        //返回列表页面,重定向到查询所有员工的请求
        return "redirect:/emps";
    }

    /**
     * 查询员工，来到修改页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public String getEmp(@PathVariable("id") Integer id,Model model){
        //1.查出员工信息
        Employee employee = employeeDao.get(id);
        //2.查出需要回显的信息放在请求域中
        model.addAttribute("employee",employee);
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("depts",departments);
        return "edit";
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.PUT)
    public String updateEmp(@ModelAttribute("emoloyee") Employee employee,@PathVariable("id") Integer id){
        System.out.println("要修改的员工"+employee);
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    @ModelAttribute
    public void myModelAttribute(@RequestParam(value = "id",required = false) Integer id,Model model){
        if(id!=null){
            Employee employee = employeeDao.get(id);
            model.addAttribute("employee",employee);
        }
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    public String deleteEmp(@PathVariable("id") Integer id){
        employeeDao.delete(id);
        return "redirect:/emps";
    }

}
