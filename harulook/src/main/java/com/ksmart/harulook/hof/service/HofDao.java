package com.ksmart.harulook.hof.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HofDao implements HofInterface {
	
	@Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	/*이번 달 좋아요 랭크보기*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.hof.service.HofInterface#selectBoardLikeRank()
	 */
	@Override
	public List<HofRankDto> selectBoardLikeRank(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.selectBoardLikeRank");
	}
	/*명예의전당 등록처리*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.hof.service.HofInterface#insertHof(com.ksmart.harulook.hof.service.HofDto)
	 */
	@Override
	public int insertHof(HofDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.hof.service.HofMapper.insertHof",dto);
	}
	/*이번 달 명예의전당 목록보기*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.hof.service.HofInterface#selectHofList()
	 */
	@Override
	public List<HofDto> selectHofList(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.selectHofList");
	}
	/*명예의전당 중복체크*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.hof.service.HofInterface#selectDuplicateHof(java.lang.String)
	 */
	@Override
	public int selectDuplicateHof(String boardNo){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.hof.service.HofMapper.dupliacteHof",boardNo);
	}
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.hof.service.HofInterface#insertHofPoint(com.ksmart.harulook.hof.service.HofDto)
	 */
	/*명예의전당 선정자 포인트 주기*/
	@Override
	public int insertHofPoint(HofDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.hof.service.HofMapper.insertHofPoint",dto);
	}
	
	
	/*이번 달 명예의전당 선정방법*/
	public void insertHof(){
		HofDto dto = new HofDto();
		List<HofRankDto> list = selectBoardLikeRank();
		/*예뻐요 랭크 수 3위까지 불러오기*/
		for(int n =0,rank=1; rank<4;n++){
			
			String boardNo = list.get(n).getBoardNo();
			int r = list.get(n).getRank();
			int nextr = list.get(n+1).getRank();
			int result = selectDuplicateHof(boardNo);
			
			if(result==0){//명예의전당에 등록된 게시물 아닐때
				dto.setBoardNo(boardNo); 
				dto.setHofRank(rank);
				switch(rank){//등수에 따른 상품
				case 1 :dto.setPointPolicyNo("point_ex_6");break;//1등
				case 2 :dto.setPointPolicyNo("point_ex_7");break;//2등
				case 3 :dto.setPointPolicyNo("point_ex_8");break;//3등
				default : break;
				}
				insertHof(dto);
				insertHofPoint(dto);
				if(r!=nextr){//이번게시물과 다음게시물이 같은등수가 아닐때만 등수를 증가시킨다.
					rank++;
				}
				
			}
		}
		System.out.println("insertHof종료");
		}

	
}
