package com.example.demo1.Service;

import com.example.demo1.Utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;


public abstract class BaseService<T> {
    public boolean saveOrUpdate(T entity) {
        if (entity == null) {
            return false;
        }

        Transaction transaction = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.saveOrUpdate(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }


    public T getById(Integer id, Class<T> clazz) {
        T dbEntity = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession();) {
            dbEntity = session.get(clazz, id);
            return dbEntity;
        } catch (Exception e) {
            e.printStackTrace();
            return dbEntity;
        }
    }

    public boolean deleteById(Integer id, Class<T> clazz) {
        T dbEntity = null;
        Transaction transaction = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession();) {
            transaction = session.beginTransaction();

            dbEntity = session.get(clazz, id);
            session.delete(dbEntity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }
}

