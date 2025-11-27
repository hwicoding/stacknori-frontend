## Stacknori DOC Log

> 이 파일은 작업 중간 로그를 기록한 뒤 push하면 Notion DB로 자동 전송됩니다.  

> 작성 → `git add DOC_LOG.md` → `git commit` → `git push` → Actions 완료 후 파일이 초기화되며, 아래 템플릿이 다시 채워집니다.

### 작성 루틴

1. **작업 전**: 현재 목표/이슈를 `0. 메타` 영역에 간단히 적고 브랜치/참조 티켓을 명시합니다.

2. **작업 중**: 문제 해결 과정과 의사결정을 `2. Troubleshooting & Decisions` 표에 적습니다.

3. **작업 후**: 완료한 내용과 다음 액션을 각각 `1. 작업 요약`, `3. 다음 액션` 섹션에 정리합니다.

4. **Push**: 커밋 메시지를 간결하게 남기고 push하면 Notion에 Markdown 구조 그대로 저장됩니다.

---

### 0. 메타

- **Date**: 2025-11-27

- **Author**: @hwicoding

- **Branch / Ref**: `main`

- **Related Issue / Ticket**: N/A

### 1. 작업 요약

- DOC_LOG 자동화 설정 완료 (템플릿 파일, 스크립트, GitHub Actions 워크플로우 생성)

- GitHub Secrets 설정 완료 (NOTION_API_KEY, NOTION_DATABASE_ID)

- Notion 동기화 테스트 진행

### 2. Troubleshooting & Decisions

| 항목 | 내용 |

| --- | --- |

| 이슈 | 프론트엔드 레포지토리에 DOC_LOG 자동화 시스템 구축 필요 |

| 원인 분석 | 백엔드와 동일한 시스템을 프론트엔드에도 적용하여 개발 일지 자동화 필요 |

| 선택한 해결책 | 백엔드의 notion_sync.py 스크립트를 프론트엔드에 적용하고, GitHub Actions 워크플로우 설정 |

| 영향 범위/추가 조치 | DOC_LOG.md 수정 시 자동으로 Notion에 페이지 생성 및 파일 초기화 |

### 3. 다음 액션

- [x] Notion 동기화 테스트 결과 확인 (워크플로우 수동 실행 옵션 추가)

- [ ] Flutter 프로젝트 초기 설정 진행

