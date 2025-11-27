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

- FVM을 사용하여 Flutter 3.38.3 (최신 stable) 버전으로 프로젝트 생성

- 불필요한 플랫폼 폴더 삭제 (linux, macos, windows) - 웹/모바일 중심 프로젝트

- FVM 설정 완료 (.fvm/fvm_config.json) 및 .gitignore 업데이트

- 프로젝트 구조 확인 및 실행 가능 여부 검증 (flutter analyze 통과)

### 2. Troubleshooting & Decisions

| 항목 | 내용 |

| --- | --- |

| 이슈 | Flutter 프로젝트 초기화 및 안정적인 버전 관리 필요 |

| 원인 분석 | FVM을 사용하여 프로젝트별 Flutter 버전 관리 필요, 최신 stable 버전(3.38.3) 사용 결정 |

| 선택한 해결책 | FVM으로 Flutter 3.38.3 설치 및 프로젝트에 적용, 데스크톱 플랫폼 폴더 삭제로 프로젝트 구조 단순화 |

| 영향 범위/추가 조치 | 웹/모바일(Android/iOS) 플랫폼만 유지, 향후 데스크톱 지원 불필요 판단 |

### 3. 다음 액션

- [x] Flutter 프로젝트 초기 설정 진행

- [ ] 의존성 설정 (Riverpod, Dio, go_router 등)

- [ ] Clean Architecture 폴더 구조 생성

