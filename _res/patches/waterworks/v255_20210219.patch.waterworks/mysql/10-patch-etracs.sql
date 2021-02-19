INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.ADMIN', 'WATERWORKS', 'WATERWORKS', NULL, NULL, 'ADMIN');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.APPROVER', 'WATERWORKS', 'WATERWORKS', NULL, NULL, 'APPROVER');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.BILLING', 'WATERWORKS BILLING', 'WATERWORKS', NULL, NULL, 'BILLING');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.MASTER', 'WATERWORKS MASTER', 'WATERWORKS', NULL, NULL, 'MASTER');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.READER', 'WATERWORKS READER', 'WATERWORKS', NULL, NULL, 'READER');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.REPORT', 'WATERWORKS REPORT', 'WATERWORKS', NULL, NULL, 'REPORT');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.RULE_AUTHOR', 'WATERWORKS RULE_AUTHOR', 'WATERWORKS', NULL, NULL, 'RULE_AUTHOR');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('WATERWORKS.SHARED', 'WATERWORKS SHARED', 'WATERWORKS', NULL, NULL, 'SHARED');

INSERT INTO `collectiontype` (`objid`, `state`, `name`, `title`, `formno`, `handler`, `allowbatch`, `barcodekey`, `allowonline`, `allowoffline`, `sortorder`, `org_objid`, `org_name`, `fund_objid`, `fund_title`, `category`, `system`, `queuesection`, `allowpaymentorder`, `allowkiosk`, `allowcreditmemo`, `info`) 
VALUES ('WATERWORKS_COLLECTION', 'ACTIVE', 'WATERWORKS', 'WATERWORKS', '51C', 'waterworks', '0', 'TCWS', '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL);

INSERT INTO `sys_domain` (`name`, `connection`) VALUES ('Waterworks', 'waterworks');

