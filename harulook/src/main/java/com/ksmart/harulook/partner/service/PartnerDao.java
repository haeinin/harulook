package com.ksmart.harulook.partner.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.member.service.MemberDto;

@Repository
public class PartnerDao implements PartnerInterface {

	 @Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	 
	 /*제휴계약 신청처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#insertCooContract(com.ksmart.harulook.partner.service.PartnerDto)
	 */
	@Override
	public int insertCooContract(PartnerDto dto) {
	        return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.cooContractInsert", dto);
	    }
	 /*제휴계약번호 번호 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectLastCooContractNo()
	 */
	@Override
	public String selectLastCooContractNo(){
		 String LastCooContractNo="";
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.getLastCooContractNo",LastCooContractNo);
	 }
	 /*제휴계약 상세보기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractDetail(java.lang.String)
	 */
	@Override
	public PartnerDto selectCooContractDetail(String cooContractNo){
			return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.cooContractDetail",cooContractNo);
		}
	 /*제휴계약 전체목록보기(관리자)*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractList()
	 */
	@Override
	public List<PartnerDto> selectCooContractList(){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractAllList");
		}
	 /*제휴계약 목록보기(개인)*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractList(java.lang.String)
	 */
	@Override
	public List<PartnerDto> selectCooContractList(String id){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractList",id);
		}
	 /*제휴계약 수정처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#updateCooContract(com.ksmart.harulook.partner.service.PartnerDto)
	 */
	@Override
	public int updateCooContract(PartnerDto dto){
			return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.cooContractUpdate", dto);
		}
	 /*제휴결제예정금액 보기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractBill(java.lang.String)
	 */
	@Override
	public List<PartnerBillDto> selectCooContractBill(String cooContractNo){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractBill", cooContractNo);
		}
	 /*제휴결제 처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#insertCooContractPay(com.ksmart.harulook.partner.service.PartnerBillDto)
	 */
	@Override
	public int insertCooContractPay(PartnerBillDto dto){
		 return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayinsert", dto);
	 }
	 /*제휴결제상태 변경처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#updateCooContractPayStat(com.ksmart.harulook.partner.service.PartnerBillDto)
	 */
	@Override
	public int updateCooContractPayStat(PartnerBillDto dto){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayStatUpdate", dto);
	 }
	 /*제휴정지해제*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#updateCooContractRelieve(com.ksmart.harulook.partner.service.PartnerBillDto)
	 */
	@Override
	public int updateCooContractRelieve(PartnerBillDto dto){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.updateCooContractRelieve", dto);
	 }
	 /*제휴결제처리 후 제휴예정데이터 삭제*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#deleteCooContractBill(com.ksmart.harulook.partner.service.PartnerBillDto)
	 */
	@Override
	public int deleteCooContractBill(PartnerBillDto dto){
		 return sqlSessionTemplate.delete("com.ksmart.harulook.partner.service.PartnerMapper.cooContractBillDelete", dto);
	 }
	 /*제휴결제내역 보기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractPayList(java.lang.String)
	 */
	@Override
	public List<PartnerPayDto> selectCooContractPayList(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayList", cooContractNo);
	 }
	 /*제휴계약 승인처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#updateCooContractAdmit(com.ksmart.harulook.partner.service.PartnerDto)
	 */
	@Override
	public int updateCooContractAdmit(PartnerDto dto){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.cooContractAdmit", dto);
	 }
	 /*제휴결제 폼 요청*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractPayForm(java.lang.String)
	 */
	@Override
	public PartnerBillDto selectCooContractPayForm(String cooBillNo){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayForm", cooBillNo);
	 }
	 /*제휴계약업체 상세보기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractCompany(java.lang.String)
	 */
	@Override
	public MemberDto selectCooContractCompany(String userId){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.cooContractCompany", userId);
	 }
	 /*제휴계약 수수료 입력처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#insertCooContractBill(java.lang.String, java.lang.String)
	 */
	@Override
	public int insertCooContractBill(String cooBillNo,String cooContractNo){
		 Map<String,String> map = new HashMap<String,String>();
		 map.put("cooBillNo", cooBillNo);
		 map.put("cooContractNo", cooContractNo);
		 return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.cooContractBillInsert", map);
	 }
	 /*제휴종료시 수수료 입력처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#insertEndBill(java.lang.String, java.lang.String)
	 */
	@Override
	public int insertEndBill(String cooBillNo,String cooContractNo){
		 Map<String,String> map = new HashMap<String,String>();
		 map.put("cooBillNo", cooBillNo);
		 map.put("cooContractNo", cooContractNo);
		 return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.insertEndBill", map);
	 }
	 /*제휴계약이름 전체불러오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectCooContractNo()
	 */
	@Override
	public List<String> selectCooContractNo(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getCooContractNo");
	 }
	 /*제휴계약예정 번호 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectLastCooBillNo()
	 */
	@Override
	public String selectLastCooBillNo(){
		 String LastCooBillNo="";
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.getLastCooBillNo",LastCooBillNo);
	 }
	 /*제휴업체 일별 방문자 수 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectDailyVisitor(java.util.HashMap)
	 */
	@Override
	public List<PartnerStatsDto> selectDailyVisitor(HashMap<String,String> map){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getDailyVisitor",map);
	 }
	 /*제휴업체 월별 방문자 수 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectMonthlyVisitor(java.lang.String)
	 */
	@Override
	public List<PartnerStatsDto> selectMonthlyVisitor(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getMonthlyVisitor",cooContractNo);
	 }
	 /*제휴업체 월별 유입방문자 수 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectMonthlyInflux(java.lang.String)
	 */
	@Override
	public List<PartnerStatsDto> selectMonthlyInflux(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getMonthlyInflux",cooContractNo);
	 }
	 /*제휴업체 주별 방문자 수 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectWeeklyVisitor(java.lang.String)
	 */
	@Override
	public List<PartnerStatsDto> selectWeeklyVisitor(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getWeeklyVisitor",cooContractNo);
	 }
	 /*제휴업체 주별 유입 방문자 수 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectWeeklyInflux(java.lang.String)
	 */
	@Override
	public List<PartnerStatsDto> selectWeeklyInflux(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getWeeklyInflux",cooContractNo);
	 }
	 /*제휴업체 쿠폰 번호 중복체크*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectDuplicateCode(java.lang.String)
	 */
	@Override
	public int selectDuplicateCode(String cooContractCode){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.duplicateCode",cooContractCode);
	 }
	 /*상품별 구매량 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectBuyCount(java.lang.String)
	 */
	@Override
	public HashMap<String,Integer> selectBuyCount(String mallProNo){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.getBuyStats",mallProNo);
	 }
	 /*전체 상품번호 가져오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectMallProNo()
	 */
	@Override
	public List<String> selectMallProNo(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getMallProNo");
	 }
	 /*제휴승인된 배너 이미지 불러오기*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectBanner()
	 */
	@Override
	public List<HashMap<String,String>> selectBanner(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getBanner");
	 }
	 /*기간만료된 제휴계약 조회*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectEndCooContractList()
	 */
	@Override
	public List<String> selectEndCooContractList(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getEndCooContractList");
	 }
	 /*기간만료된 제휴계약 상태변경*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#updateEndCooContract(java.lang.String)
	 */
	@Override
	public int updateEndCooContract(String cooContractNo){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.updateEndCooContract",cooContractNo);
	 }
	 /*제휴 시작할 계약 조회*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectStartCooContract()
	 */
	@Override
	public List<String> selectStartCooContract(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getStartCooContract");
	 }
	 /* 제휴진행 상태로 변경*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#updateStartCooContract(java.lang.String)
	 */
	@Override
	public int updateStartCooContract(String cooContractNo){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.updateStartCooContract",cooContractNo);
	 }
	 /*납부기한 지난 제휴계약 조회*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#selectOverDueList()
	 */
	@Override
	public List<String> selectOverDueList(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getOverDueList");
	 }
	 /*납부기한 지난 제휴정지*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.partner.service.PartnerInterface#updateOverDue(java.lang.String)
	 */
	@Override
	public int updateOverDue(String cooContractNo){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.updateOverDue",cooContractNo);
	 }

}
