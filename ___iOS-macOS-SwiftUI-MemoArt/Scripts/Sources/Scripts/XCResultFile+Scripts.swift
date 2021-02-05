import XCResultKit

extension XCResultFile {
    var testPlanSummariesId: String? {
        getInvocationRecord()?.actions.first?.actionResult.testsRef?.id
    }

    func screenshotAttachmentPayloadId(summaryId: String) -> String? {
        getActionTestSummary(id: summaryId)?
            .activitySummaries.first(where: {
                $0.activityType == "com.apple.dt.xctest.activity-type.attachmentContainer"
            })?
            .attachments.first?
            .payloadRef?.id
    }
}

extension ActionTestPlanRunSummary {
    var screenshotTests: [ActionTestMetadata]? {
        testableSummaries.first?
            .tests.first?
            .subtestGroups.first?
            .subtestGroups.first?
            .subtests
    }
}
