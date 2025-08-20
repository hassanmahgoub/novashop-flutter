import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/user.dart';
import '../data/user_data.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_item.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late User _user;
  late UserPreferences _preferences;

  @override
  void initState() {
    super.initState();
    _user = UserData.getSampleUser();
    _preferences = _user.preferences;
  }

  void _updatePreferences(UserPreferences newPreferences) {
    setState(() {
      _preferences = newPreferences;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Text(
          l10n.settings,
          style: TextStyle(
            color: Theme.of(context).appBarTheme.foregroundColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.deepPurple[100],
                    child: _user.profileImageUrl != null
                        ? ClipOval(
                            child: Image.network(
                              _user.profileImageUrl!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  _user.initials,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                );
                              },
                            ),
                          )
                        : Text(
                            _user.initials,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _user.fullName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _user.email,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Notifications Section
            SettingsSection(
              title: l10n.notifications,
              children: [
                SettingsItem(
                  icon: Icons.email_outlined,
                  title: l10n.emailNotifications,
                  subtitle: l10n.receiveUpdatesViaEmail,
                  trailing: Switch(
                    value: _preferences.emailNotifications,
                    onChanged: (value) {
                      _updatePreferences(_preferences.copyWith(emailNotifications: value));
                    },
                    activeColor: Colors.deepPurple,
                  ),
                ),
                SettingsItem(
                  icon: Icons.notifications_outlined,
                  title: l10n.pushNotifications,
                  subtitle: l10n.receivePushNotifications,
                  trailing: Switch(
                    value: _preferences.pushNotifications,
                    onChanged: (value) {
                      _updatePreferences(_preferences.copyWith(pushNotifications: value));
                    },
                    activeColor: Colors.deepPurple,
                  ),
                ),
                SettingsItem(
                  icon: Icons.sms_outlined,
                  title: l10n.smsNotifications,
                  subtitle: l10n.receiveSMSUpdates,
                  trailing: Switch(
                    value: _preferences.smsNotifications,
                    onChanged: (value) {
                      _updatePreferences(_preferences.copyWith(smsNotifications: value));
                    },
                    activeColor: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Preferences Section
            SettingsSection(
              title: l10n.preferences,
              children: [
                SettingsItem(
                  icon: Icons.language_outlined,
                  title: l10n.language,
                  subtitle: languageProvider.getLanguageName(languageProvider.currentLocale.languageCode),
                  onTap: () {
                    _showLanguageDialog(context, languageProvider);
                  },
                ),
                SettingsItem(
                  icon: Icons.attach_money_outlined,
                  title: 'Currency',
                  subtitle: _preferences.currency,
                  onTap: () {
                    _showCurrencyDialog();
                  },
                ),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return SettingsItem(
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Mode',
                      subtitle: 'Switch to dark theme',
                      trailing: Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.setTheme(value);
                          _updatePreferences(_preferences.copyWith(darkMode: value));
                        },
                        activeColor: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Account Section
            SettingsSection(
              title: 'Account',
              children: [
                SettingsItem(
                  icon: Icons.security_outlined,
                  title: 'Privacy & Security',
                  subtitle: 'Manage your privacy settings',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Privacy & Security coming soon!')),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.payment_outlined,
                  title: 'Payment Methods',
                  subtitle: 'Manage payment options',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment Methods coming soon!')),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.location_on_outlined,
                  title: 'Addresses',
                  subtitle: 'Manage shipping addresses',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Address Management coming soon!')),
                    );
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Support Section
            SettingsSection(
              title: 'Support',
              children: [
                SettingsItem(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                  subtitle: 'Get help and support',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Help Center coming soon!')),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.feedback_outlined,
                  title: 'Send Feedback',
                  subtitle: 'Share your thoughts',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Feedback form coming soon!')),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.info_outline,
                  title: 'About',
                  subtitle: 'App version and info',
                  onTap: () {
                    _showAboutDialog();
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, LanguageProvider languageProvider) {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.selectLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: languageProvider.supportedLanguages.map((lang) {
              return ListTile(
                title: Text(lang['nativeName']!),
                subtitle: Text(lang['name']!),
                onTap: () {
                  languageProvider.setLanguage(lang['code']!);
                  _updatePreferences(_preferences.copyWith(language: lang['name']!));
                  Navigator.pop(dialogContext);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Currency'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('USD - US Dollar'),
                onTap: () {
                  _updatePreferences(_preferences.copyWith(currency: 'USD'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('EUR - Euro'),
                onTap: () {
                  _updatePreferences(_preferences.copyWith(currency: 'EUR'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('GBP - British Pound'),
                onTap: () {
                  _updatePreferences(_preferences.copyWith(currency: 'GBP'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'E-Commerce App',
      applicationVersion: '1.0.0',
      applicationIcon: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
          size: 30,
        ),
      ),
      children: [
        const Text('A modern e-commerce application built with Flutter.'),
      ],
    );
  }
}
