#!/bin/bash
if which mint >/dev/null; then
    rm -f $SRCROOT/MockResults.swift

# Repository
rm -f $SRCROOT/Mocks/RepositoryMockResults.swift
mint run mockolo mockolo --sourcedirs $SRCROOT/Domain/Repository --destination $SRCROOT/Mocks/RepositoryMockResults.swift

# UseCase
rm -f $SRCROOT/Mocks/UseCaseMockResults.swift
mint run mockolo mockolo --sourcedirs $SRCROOT/Domain/UseCase --destination $SRCROOT/Mocks/UseCaseMockResults.swift

# Infrastructure
rm -f $SRCROOT/Mocks/InfrastructureMockResults.swift
mint run mockolo mockolo --sourcedirs $SRCROOT/Qiitable/Infrastructure  --testable-imports Qiitable --destination $SRCROOT/Mocks/InfrastructureMockResults.swift

# Router
rm -f $SRCROOT/Mocks/RouterMockResults.swift
mint run mockolo mockolo --sourcedirs $SRCROOT/Qiitable/Router --destination $SRCROOT/Mocks/RouterMockResults.swift

# Presenter
rm -f $SRCROOT/Mocks/PresenterMockResults.swift
mint run mockolo mockolo --sourcedirs $SRCROOT/Qiitable/Presenter --destination $SRCROOT/Mocks/PresenterMockResults.swift

else
  echo "warning: Mint not installed, download from https://github.com/yonaskolb/Mint"
fi
