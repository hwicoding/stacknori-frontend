# GitHub Secrets 설정 가이드

프론트엔드 레포지토리에 Notion DOC_LOG 자동화를 위한 GitHub Secrets를 설정합니다.

## 설정 단계

### 1. GitHub 레포지토리 접속
- 레포지토리: `https://github.com/hwicoding/stacknori-frontend`
- Settings → Secrets and variables → Actions 이동

### 2. 필요한 Secrets 추가

#### 2.1 NOTION_API_KEY 설정
1. "New repository secret" 클릭
2. Name: `NOTION_API_KEY`
3. Secret: Notion Integration의 Internal Integration Token 값 입력
   - Notion 워크스페이스 → Settings & Members → Connections → Develop or manage integrations
   - "Stacknori Dev-Journal" Integration 선택 (또는 새로 생성)
   - "Show" 버튼 클릭하여 토큰 복사
   - 형식: `secret_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

#### 2.2 NOTION_DATABASE_ID 설정
1. "New repository secret" 클릭
2. Name: `NOTION_DATABASE_ID`
3. Secret: Notion Dev-Journal 데이터베이스 ID 입력
   - Notion에서 Dev-Journal 데이터베이스 페이지 열기
   - URL에서 데이터베이스 ID 추출
   - 예: `https://www.notion.so/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx?v=...`
   - `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` 부분이 데이터베이스 ID (32자리, 하이픈 포함)
   - 하이픈을 제거하고 32자리 문자열로 변환 필요
   - 예: `a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6`

### 3. Notion Integration 권한 확인

Notion Dev-Journal 데이터베이스에 Integration이 공유되어 있는지 확인:
1. Notion에서 Dev-Journal 데이터베이스 열기
2. 우측 상단 "..." 메뉴 → "Connections" 선택
3. "Stacknori Dev-Journal" Integration이 연결되어 있는지 확인
4. 없으면 "Add connections"로 추가

### 4. 테스트

설정 완료 후 테스트:
1. `DOC_LOG.md` 파일 수정 (템플릿 내용 변경)
2. 커밋 및 푸시:
   ```bash
   git add DOC_LOG.md
   git commit -m "test: DOC_LOG sync test"
   git push
   ```
3. GitHub Actions 탭에서 워크플로우 실행 확인
4. Notion 데이터베이스에서 새 페이지 생성 확인

## 참고사항

- 백엔드 레포지토리와 동일한 Notion DB를 사용할 수 있습니다
- Integration Token은 안전하게 보관하세요 (재생성 불가)
- 데이터베이스 ID는 URL에서 추출하거나 Notion API로 조회 가능합니다

