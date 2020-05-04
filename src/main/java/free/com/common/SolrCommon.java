package free.com.common;

import java.io.IOException;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import free.com.utils.StringUtils;

public class SolrCommon {

	private static HttpSolrClient solr = null;

	/**
	 * 获取Solr
	 *
	 * @return
	 */
	private static HttpSolrClient initSolr(String SORL_URL) {
		solr = new HttpSolrClient.Builder(SORL_URL).withConnectionTimeout(10000).withSocketTimeout(60000).build();
		return solr;
	}

	/**
	 * 往索引库添加文档
	 *
	 * @throws SolrServerException
	 * @throws IOException
	 */
	public static void addDoc(Object obj, String SORL_URL) throws SolrServerException, IOException {
		initSolr(SORL_URL);
		// SolrInputDocument document = new SolrInputDocument();
		// document.addField("id", "4");
		// document.addField("test_name", "钢B侠");
		// document.addField("description", "一个逗比的码农");
		solr.addBean(obj);
		// solr.add(document);
		solr.commit();
		solr.close();
		System.out.println("添加成功");
	}

	/**
	 * 根据ID从索引库删除文档
	 *
	 * @throws SolrServerException
	 * @throws IOException
	 */
	public static void deleteDocumentById(Object obj, String SORL_URL) throws SolrServerException, IOException {
		initSolr(SORL_URL);
		solr.deleteById("6");
		solr.commit();
		solr.close();
	}

	/**
	 * 根据设定的查询条件进行文档字段的查询
	 *
	 * @throws Exception
	 */
	public static List<Object> querySolr(String searKey, String searLimit, Object obj, String SORL_URL)
			throws Exception {

		initSolr(SORL_URL);
		SolrQuery query = new SolrQuery();

		// 下面设置solr查询参数

		// query.set("q", "钢A侠");// 相关查询，比如某条数据某个字段含有周、星、驰三个字 将会查询出来 ，这个作用适用于联想查询
		// query.setQuery("逗比");
		if (StringUtils.isEmpty(searKey)) {
			query.set("q", "*:*");// 参数q 查询所有
		} else {
			query.set("q", searKey);
		}
		// 参数fq, 给query增加过滤查询条件
		// query.addFacetQuery("id:[0 TO 9]");
		// query.addFilterQuery("description:一个逗比的码农");

		// 参数df,给query设置默认搜索域，从哪个字段上查找
		if (!StringUtils.isEmpty(searLimit)) {
			query.set("df", searLimit);
		}

		// 参数sort,设置返回结果的排序规则
		// query.setSort("id", SolrQuery.ORDER.desc);

		// 设置分页参数
		// query.setStart(0);
		// query.setRows(10);
		//
		// // 设置高亮显示以及结果的样式
		// query.setHighlight(true);
		// query.addHighlightField("name");
		// query.setHighlightSimplePre("<font color='red'>");
		// query.setHighlightSimplePost("</font>");

		// 执行查询
		QueryResponse response = solr.query(query);

		// 获取返回结果
		SolrDocumentList resultList = response.getResults();

		for (SolrDocument document : resultList) {
			System.out.println(document);
		}

		// 获取实体对象形式
		List<Object> clsList = (List<Object>) response.getBeans(obj.getClass());
		return clsList;
	}
}
