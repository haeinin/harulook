package com.ksmart.harulook.adboard.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdBoardDao implements AdBoardInterface{
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	/*게시물 목록 요청 메서드*/

	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectAdBoard()
	 */
	@Override
	public List<AdBoardDto> selectAdBoard(){
		log.debug("광고 게시물 목록 요청 in Dao");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoardList");
	}
	/*광고 상품번호에서 가장 높은 번호 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectGoodsNo()
	 */
	@Override
	public String selectGoodsNo(){
		log.debug("광고 상품 번호 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getGoodsNo");
	}
	/*광고 게시물번호에서 가장 높은 번호 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardNo()
	 */
	@Override
	public String selectBoardNo(){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getBoardNo");
	}
	/*광고 게시물 입력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#insertAdBoard(com.ksmart.harulook.adboard.service.AdBoardDto)
	 */
	@Override
	public int insertAdBoard(AdBoardDto adBoard){
		log.debug("DAO에서 입력되는 adBoardDto : " + adBoard.toString());
		return sqlSessionTemplate.insert("com.ksmart.harulook.adboard.service.AdBoardMapper.insertAdBoard", adBoard);
	}
	/*광고 계약 번호에 해당하는 광고 게시물 입력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectAdBoardByContractId(java.lang.String)
	 */
	@Override
	public List<AdBoardDto> selectAdBoardByContractId(String adContractNo){
		log.debug("수정 화면 요청 in Dao");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoardListbyContractId", adContractNo);
	}
	/*광고 게심루 삭제 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#deleteAdBoard(java.lang.String)
	 */
	@Override
	public int deleteAdBoard(String adBoardNo){
		log.debug("광고 게시물 삭제 요청 in Dao");
		return sqlSessionTemplate.delete("com.ksmart.harulook.adboard.service.AdBoardMapper.deleteAdBoard", adBoardNo);
	}
	/*메인화면에서 광고 게시물 상세 보기 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardDetail(java.lang.String)
	 */
	@Override
	public AdBoardDto selectBoardDetail(String adBoardNo) {
		log.debug("광고 상세 보기 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoardDetail", adBoardNo);
	}
	/*광고위치가 1이고 광고 게시물중에 온도가 현재 온도에 해당하는 광고 게시물의 갯수 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectPlace1TempCount(java.lang.String)
	 */
	@Override
	public String selectPlace1TempCount(String temp){
		log.debug("현재 온도에 맞는 광고 게시물 수 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getPlace1TempCount", temp);
	}
	/*광고위치가 2이고 광고 게시물중에 온도가 현재 온도에 해당하는 광고 게시물의 갯수 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectPlace2TempCount(java.lang.String)
	 */
	@Override
	public String selectPlace2TempCount(String temp){
		log.debug("현재 온도에 맞는 광고 게시물 수 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getPlace2TempCount", temp);
	}
	/*광고위치가 3이고 광고 게시물중에 온도가 현재 온도에 해당하는 광고 게시물의 갯수 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectPlace3TempCount(java.lang.String)
	 */
	@Override
	public String selectPlace3TempCount(String temp){
		log.debug("현재 온도에 맞는 광고 게시물 수 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getPlace3TempCount", temp);
	}
	/*광고 위치가 1이고 현재 온도에 해당하는 광고 게시물의 갯수가 0일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace1WhenCount0()
	 */
	@Override
	public AdBoardDto selectBoardPlace1WhenCount0(){
		log.debug("첫번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace1WhenCount0");
	}
	/*광고 위치가 1이고 현재 온도에 해당하는 광고 게시물의 갯수가 1일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace1WhenCount1()
	 */
	@Override
	public AdBoardDto selectBoardPlace1WhenCount1(String temp){
		log.debug("첫번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace1WhenCount1", temp);
	}
	/*광고 위치가 1이고 현재 온도에 해당하는 광고 게시물의 갯수가 2일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace1WhenCount2()
	 */
	@Override
	public AdBoardDto selectBoardPlace1WhenCount2(){
		log.debug("첫번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace1WhenCount2");
	}
	/*광고 위치가 2이고 현재 온도에 해당하는 광고 게시물의 갯수가 0일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace2WhenCount0()
	 */
	@Override
	public AdBoardDto selectBoardPlace2WhenCount0(){
		log.debug("두번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace2WhenCount0");
	}
	/*광고 위치가 2이고 현재 온도에 해당하는 광고 게시물의 갯수가 1일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace2WhenCount1()
	 */
	@Override
	public AdBoardDto selectBoardPlace2WhenCount1(String temp){
		log.debug("두번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace2WhenCount1", temp);
	}
	/*광고 위치가 2이고 현재 온도에 해당하는 광고 게시물의 갯수가 2일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace2WhenCount2()
	 */
	@Override
	public AdBoardDto selectBoardPlace2WhenCount2(){
		log.debug("두번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace2WhenCount2");
	}
	/*광고 위치가 3이고 현재 온도에 해당하는 광고 게시물의 갯수가 0일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace3WhenCount0()
	 */
	@Override
	public AdBoardDto selectBoardPlace3WhenCount0(){
		log.debug("세번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace3WhenCount0");
	}
	/*광고 위치가 3이고 현재 온도에 해당하는 광고 게시물의 갯수가 1일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace3WhenCount1()
	 */
	@Override
	public AdBoardDto selectBoardPlace3WhenCount1(String temp){
		log.debug("세번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace3WhenCount1", temp);
	}
	/*광고 위치가 3이고 현재 온도에 해당하는 광고 게시물의 갯수가 2일때 광고 게시물을 조회 하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adboard.service.AdBoardServiceInterface#selectBoardPlace3WhenCount2()
	 */
	@Override
	public AdBoardDto selectBoardPlace3WhenCount2(){
		log.debug("세번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace3WhenCount2");
	}
	

}
