# Enterprise IAM Governance & Access Control Audit (SQL)

## 📌 Project Overview
This repository showcases a relational database design and compliance tracking workflow engineered for **Commercial GRC and Identity Access Management (IAM) Consultations**. Built using **SQLite** and **DBeaver**, the project simulates automated logical access logging and boundary compliance monitoring to satisfy stringent controls required by **SOC 2 Type II (Logical Access)** and **ISO 27001 (A.9 Access Control)** frameworks.

## 🛠️ The Business Scenario
A commercial enterprise must enforce the **Principle of Least Privilege** across its digital ecosystem. This project tracks core organizational identities (`iam_users`) and maps them against real-time centralized authorization streams (`iam_authorization_logs`). The schema enforces relational structural boundaries to log permission state adjustments and track rogue privilege requests.

## 📊 Phase 3: Technical Compliance Query
The core auditing engine employs multi-table conditional inner joins to scan the access logs, immediately flagging unauthorized or explicitly `Denied` privilege elevation attempts by standard business users.

```sql
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
```

## 📈 Professional GRC Competencies Demonstrated
*   **Access Control Auditing:** Translating technical authentication logs into clean, actionable compliance anomalies.
*   **Relational Integrity Constraints:** Structuring database environments using primary/foreign key mappings to trace insider threat footprints.
*   **Framework Governance Mapping:** Designing tracking workflows that map directly to enterprise security baselines.

