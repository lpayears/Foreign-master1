package com.lpa.dao.impl;

import com.lpa.dao.ProjectDao;
import com.lpa.entity.Project;
import com.lpa.utils.BaseDao;
import com.lpa.utils.MyPo;
import com.lpa.utils.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Repository
public class ProjectDaoImplement extends BaseDao implements ProjectDao {
    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Project getProjectById(int id){
        String hql = "from Project where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return (Project)query.uniqueResult();
    }

    @Override
    public void addProject(Project project){
        sessionFactory.getCurrentSession().save(project);
    }

    @Override
    public boolean updateProject(Project project){
        String hql = "update Project set num=?,yw_time=?,company_id.id=?,user_id.id=?,currency_code.id=?,country_code.id=?,cellphone=?,address=?,book_time=?,check_time=?,status=? where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,project.getNum());
        query.setParameter(1,project.getYw_time());
        query.setParameter(2,project.getCompany_id().getId());
        query.setParameter(3,project.getUser_id().getId());
        query.setParameter(4,project.getCurrency_code().getId());
        query.setParameter(5,project.getCountry_code().getId());
        query.setParameter(6,project.getCellphone());
        query.setParameter(7,project.getAddress());
        query.setParameter(8,project.getBook_time());
        query.setParameter(9,project.getCheck_time());
        query.setParameter(10,project.getStatus());
        query.setParameter(11,project.getId());
        return query.executeUpdate()>0;
    }

    @Override
    public boolean updateCheck(Project project){
        String hql="update Project set check_time=?,status=? where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,project.getCheck_time());
        query.setParameter(1,project.getStatus());
        query.setParameter(2,project.getId());
        return query.executeUpdate()>0;
    }
    @Override
    public boolean delProject(int id){
        String hql = "delete Project where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return query.executeUpdate()>0;
    }
    @Override
    public List<Project> getAllProject(){
        String hql = "from Project";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    @Override
    public Project getMaxProject(){
        String hql = "from Project order by id desc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(1);
        return (Project)query.uniqueResult();
    }

    @Override
    public List<Project> getProjectList(Integer pn, Map<String,Long> map, MyPo po){
        String hql = "from Project where 1=1";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar nowcalendar =Calendar.getInstance();
        Calendar calendar =Calendar.getInstance();
        if (StringUtils.isNotBlank(po.getNum())){
            hql+="and num like '%"+po.getNum()+"'%";
        }
        if(po.getStatus()!=null){
            hql+="and status ='"+po.getStatus()+"'";
        }
        if (po.getType()!=null){
            if (po.getType()==0){
                calendar.add(Calendar.DATE,15);
                hql+="and book_time between '"+simpleDateFormat.format(nowcalendar.getTime())+"'" + "and '"+simpleDateFormat.format(calendar.getTime())+"'";
            }
            else if (po.getType()==1){
                if (po.getStatus() == 0){
                    calendar.add(Calendar.DATE,15);
                    hql+="and book_time between '"+simpleDateFormat.format(nowcalendar.getTime())+"'" + "and '"+simpleDateFormat.format(calendar.getTime())+"'";
                }
                else if(po.getStatus()==2){
                    calendar.add(Calendar.DATE,-15);
                    hql+="and book_time between '" +simpleDateFormat.format(calendar.getTime()) +"'"+"and '"+simpleDateFormat.format(nowcalendar.getTime())+"'";
                }
            }
           else if (po.getType()==2 ){
                if (po.getStatus()==0){
                    calendar.add(Calendar.DATE,15);
                    hql+="and book_time >='" + simpleDateFormat.format(calendar.getTime())+"'";
                }
                else if ( po.getStatus()==2){
                    calendar.add(Calendar.DATE,-15);
                    hql+="and book_time <='" + simpleDateFormat.format(calendar.getTime())+"'";
                }
            }

        }
        else if (po.getEndDate()!=null || po.getStartDate()!=null){
                hql+="and check_time between ' "+simpleDateFormat.format(po.getStartDate())+"' and '"+simpleDateFormat.format(po.getEndDate())+"'";
        }
        if (po.getExport()!=null){
            if (po.getExport()==1){
                Query query = sessionFactory.getCurrentSession().createQuery(hql);
                return query.list();
            }
        }

        return super.executeQuery2(hql,pn,map);
    }
}
