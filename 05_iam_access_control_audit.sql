-- Phase 3: GRC Identity & Access Management Compliance Audit
-- Flags unauthorized privilege escalation attempts across standard accounts

SELECT 
    u.username AS Compromised_Account,
    u.job_title AS Business_Role,
    u.current_clearance_level AS Assigned_Permissions,
    l.requested_action AS Violating_Activity,
    l.action_status AS Audit_Flag,
    l.timestamp AS Violation_Time
FROM iam_users u
JOIN iam_authorization_logs l ON u.user_id = l.user_id
WHERE l.action_status LIKE 'Denied%'
ORDER BY l.timestamp DESC;
