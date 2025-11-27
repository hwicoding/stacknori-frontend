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

- Phase 1 프로젝트 기본 설정 완료

- 의존성 설정: Riverpod, Dio, go_router, shared_preferences, freezed, widgetbook 등 추가

- Clean Architecture 폴더 구조 생성 (core, domain, data, presentation)

- API 클라이언트 설정 완료 (Dio 기반, JWT 토큰 자동 추가 인터셉터, 에러 핸들링)

- Riverpod ProviderScope 설정 및 main.dart 업데이트

### 2. Troubleshooting & Decisions

| 항목 | 내용 |

| --- | --- |

| 이슈 | 프론트엔드 프로젝트 기본 인프라 구축 필요 (의존성, 아키텍처, API 클라이언트) |

| 원인 분석 | Clean Architecture 패턴 적용 및 상태 관리(Riverpod), API 통신(Dio) 설정 필요 |

| 선택한 해결책 | Clean Architecture 폴더 구조 생성, Dio 기반 API 클라이언트에 JWT 자동 갱신 인터셉터 구현, Riverpod ProviderScope 설정 |

| 영향 범위/추가 조치 | 백엔드 API 확인 결과 인증 API만 구현됨, 로드맵/자료/진도 API는 추후 구현 예정. 현재는 인증 기능 중심으로 구조 설계 |

### 3. 다음 액션

- [x] Phase 1 프로젝트 기본 설정 완료

- [ ] 인증 관련 모델 및 Repository 구현

- [ ] 로그인 화면 구현

- [ ] Bottom Navigation Bar 구조 설정

