/*
 * Copyright 2017 Stormpath, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package autoconfigure;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * Disabling Spring Security must also disable Stormpath's Spring Security integration
 *
 * @since 1.5.0
 */
@Configuration
@PropertySource({"classpath:disabledspringsecuritydisablesstormpathss.application.properties"})
@EnableAutoConfiguration
public class DisabledSpringSecurityDisablesStormpathSSAutoConfigurationTestApplication {

}
