package com.lpa.utils;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class BaseDao {
    @Resource
    private SessionFactory sessionFactory;
    /**	 * 给query赋值的方法
     *  @author LJ
     * * @Date 2018年10月30日
     * * @Time 下午4:59:40
     * * @param query	 * @param map	 */
    private void setParamter(Query query, Map<String, Object> map)
    {
        if(map==null||map.size()==0) {
            //如果没有传查询条件则直接返回
            return;
        }
        Object value=null;
        for (Map.Entry<String, Object> entry : map.entrySet())
        {//否则则遍历map集合给命名参数进行赋值
            value=entry.getValue();
            if(value instanceof Collection) {//如果传过来的值是集合
                 query.setParameterList(entry.getKey(), (Collection) value);
            }
            else if(value instanceof Object[]) {//如果传过来的值是数组
                query.setParameterList(entry.getKey(), (Collection) value);
            }
            else {//如果传过来的值是其他类型
                 query.setParameter(entry.getKey(), value);
            }
        }
    }
    /**	 * 获取查询总记录数的hql语句的方法
     * * @author LJ
     * * @Date 2018年10月30日
     * * @Time 下午5:01:42
     * * @param hql
     * * @return	 */
    private String getCountHql(String hql) {
        /*		 * 因为hql语句可能为：select * from Book
        * * 		      也可能为：select * From Book
        * * 所以需要先将一整句hql都转为小写或大写之后，找到from的位置，再将from后面的内容截取下来组装成需要的语句
        * */
        int indexOf = hql.toLowerCase().indexOf("from");
        return "select count(*) "+hql.substring(indexOf);
    }
    /**	 * 用来调用的方法
     * n	 * @param map	 * @param session	 * @return	 */
    public List executeQuery(String hql, PageBean pageBean, Map<String, Object> map) {
        if(pageBean!=null&&pageBean.isPagination())
        {//如果需要进行分页
            String countHql = getCountHql(hql);//获取查询总记录数的hql语句
            Query countQuery = sessionFactory.getCurrentSession().createQuery(countHql);
            this.setParamter(countQuery, map);//给query赋值
            String total =countQuery.setCacheable(true).uniqueResult().toString();//查询出结果
            pageBean.setTotal(total);//将结果赋给pageBean的total属性
            Query pageQuery = sessionFactory.getCurrentSession().createQuery(hql);
            this.setParamter(pageQuery, map);
            pageQuery.setFirstResult(pageBean.getStartIndex());
            pageQuery.setMaxResults(pageBean.getRows());
            return pageQuery.list();//返回分页查出后的结果
             }
        else {//如果不需要进行分页
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            this.setParamter(query, map);
            return query.list();
        }
    }

    public List executeQuery2(String hql, Integer pn,Map<String,Long> map1) {
            //Map<String,Long> map1 = new HashMap<String, Long>();
            String countHql = getCountHql(hql);//获取查询总记录数的hql语句
            Query countQuery = sessionFactory.getCurrentSession().createQuery(countHql);
            //this.setParamter(countQuery, map);//给query赋值
            Long total =(Long)countQuery.setCacheable(true).uniqueResult();//查询出结果
            PageInfo pageInfo =new PageInfo();
            pageInfo.setTotal(total);//将结果赋给pageBean的total属性
            map1.put("total",total);
            pageInfo.setPageSize(5);
            pageInfo.setPageNum(pn);
            Query pageQuery = sessionFactory.getCurrentSession().createQuery(hql);
            //this.setParamter(pageQuery, map);
            pageQuery.setFirstResult(pageInfo.getStartIndex());
            pageQuery.setMaxResults(5);
            return pageQuery.list();//返回分页查出后的结果
    }
}


