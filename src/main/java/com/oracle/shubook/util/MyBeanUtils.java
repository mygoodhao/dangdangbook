package com.oracle.shubook.util;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
/**
 * 
 * @author 南阳德刚<br>
 * 2015年5月11日 下午3:56:16<br>
 *
 * 类说明:纠正默认情况下日期转换错误的问题
 */
public class MyBeanUtils {
	/**
	 * 
	 * @param bean 要被赋值的JavaBean
	 * @param properties 包含值的map对象
	 * @param dateFormat 如果有日期则需要指定日期格式
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void populate(Object bean, Map properties, String dateFormat) {
		ConvertUtilsBean convertUtilsBean = new ConvertUtilsBean();
		if (dateFormat!=null&&!dateFormat.isEmpty()) {		
			DateTimeConverter dtConverter = new DateConverter();
			dtConverter.setPattern(dateFormat);
			convertUtilsBean.deregister(Date.class);
			convertUtilsBean.register(dtConverter, Date.class);
		}
		BeanUtilsBean beanUtilsBean = new BeanUtilsBean(convertUtilsBean,new PropertyUtilsBean());
		try {
			beanUtilsBean.populate(bean, properties);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	@SuppressWarnings("rawtypes")
	public static void populate(Object bean, Map properties) {
		populate(bean, properties, null);
		
	}
}
