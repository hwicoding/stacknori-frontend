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

- 인증 관련 모델 및 Repository 구현 완료 (User, TokenPair, AuthRepository)

- 로그인 화면 구현 완료 (이메일/비밀번호 입력, 유효성 검사, 에러 처리)

- Bottom Navigation Bar 구조 설정 완료 (go_router 사용, 3개 탭: 로드맵, 자료 피드, 마이 페이지)

- Riverpod AuthProvider 구현 및 인증 상태 관리

- 로그인 성공 시 메인 화면 이동, 로그아웃 기능 구현

### 2. Troubleshooting & Decisions

| 항목 | 내용 |

| --- | --- |

| 이슈 | 인증 시스템 및 메인 화면 구조 구현 필요 |

| 원인 분석 | 백엔드 API 구조 확인 결과 OAuth2PasswordRequestForm 사용, Clean Architecture 패턴에 맞춰 Domain/Data 계층 분리 필요 |

| 선택한 해결책 | Domain 엔티티와 Data 모델 분리, Repository 패턴 적용, go_router의 StatefulShellRoute로 Bottom Navigation Bar 구현, Riverpod으로 인증 상태 관리 |

| 영향 범위/추가 조치 | 로그인 화면부터 시작하여 인증된 사용자만 메인 화면 접근 가능하도록 구조 설계. 로드맵/자료 피드/마이 페이지는 기본 구조만 구현 (추후 상세 기능 추가 예정) |

### 3. 다음 액션

- [x] 인증 관련 모델 및 Repository 구현

- [x] 로그인 화면 구현

- [x] Bottom Navigation Bar 구조 설정

- [ ] 로드맵 화면 상세 구현

- [ ] 자료 피드 화면 상세 구현

- [ ] 마이 페이지 상세 구현
